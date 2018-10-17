package org.ecobay.admin.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.Multipart;

import org.ecobay.admin.board.domain.NoticeFileVO;
import org.ecobay.admin.board.domain.NoticeVO;
import org.ecobay.admin.board.service.BoardAdminService;
import org.ecobay.user.util.Pagination;
import org.ecobay.user.util.UploadContoller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/board")
public class NoticeAdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadContoller.class);
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Autowired
	BoardAdminService service;
	
	@RequestMapping(value="/noticelist.do", method = RequestMethod.GET)
    public String noticeList(NoticeVO noticeVO, @RequestParam(defaultValue="1") int curPage, Model model) throws Exception {
		
		
		int listCnt = service.selectNoticeListCnt(noticeVO);
		
		Pagination pagination = new Pagination(listCnt, curPage);
		
		noticeVO.setStartIndex(pagination.getStartIndex());
		noticeVO.setCntPerPage(pagination.getPageSize());
		
		model.addAttribute("noticeList", service.noticeList(noticeVO));
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pagination", pagination);
		
		return "admin/board/noticeList.admin";
    }
	
	@ResponseBody
	@RequestMapping(value="/ajaxnoticelist.do", method = RequestMethod.GET)
    public Map<String, Object> ajaxNoticeList(NoticeVO noticeVO, 
    		@RequestParam(value="movePage") int movePage,
    		@RequestParam(value="keyWorld") String keyWorld,
    		@RequestParam(value="searchType") String searchType) throws Exception {
		
		int listCnt = service.selectNoticeListCnt(noticeVO);
		Pagination pagination = new Pagination(listCnt, movePage);
		
		noticeVO.setKeyWorld(keyWorld);
		noticeVO.setSearchType(searchType);
		noticeVO.setStartIndex(pagination.getStartIndex());
		noticeVO.setCntPerPage(pagination.getPageSize());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeList", service.noticeList(noticeVO));
		map.put("listCnt", listCnt);
		map.put("pagination", pagination);
		
		return map;
    }

    @RequestMapping(value="/noticereg.do", method = RequestMethod.GET)
    public String noticeRegGET() {
    	return "admin/board/noticeRegister.admin";
    }
    
    @RequestMapping(value="/noticereg.do", method = RequestMethod.POST)
    public String noticeRegPOST(NoticeVO vo) throws Exception {
    	service.noticeRegist(vo);
    	
    	return "redirect:/admin/board/noticelist.do";
    }
    
    @RequestMapping(value="/noticemod.do", method = RequestMethod.GET)
    public String noticeModGET(@RequestParam("idx") String notice_idx, Model model) throws Exception {
		
		int idx = Integer.parseInt(notice_idx);
		NoticeVO notice = service.noticeLoad(idx);
		
		model.addAttribute("notice", notice);
		
        return "admin/board/noticeModify.admin";
    }
	
    @RequestMapping(value="/noticemod.do", method = RequestMethod.POST)
    public String noticeModPOST(NoticeVO newNoticeVO) throws Exception {
    	
    	service.noticeUpdate(newNoticeVO);
    	int idx = newNoticeVO.getNotice_idx();
    	
        return "redirect:/admin/board/noticedetail.do?idx="+idx;
    }
    
    
    @ResponseBody
	@RequestMapping(value="/ajaxnoticedel.do", method = RequestMethod.POST)
    public Map<String, Object> ajaxNoticeDel(@RequestBody int idx) throws Exception {
		service.noticeDelete(idx);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isSuccess", "true");
		return map;
    }
	
	
    @RequestMapping(value="/noticedetail.do", method = RequestMethod.GET)
    public String noticeDetailGET(@RequestParam("idx") String notice_idx, Model model) throws Exception {
    	
    	int idx = Integer.parseInt(notice_idx);
    	service.noticeViewCnt(idx);
    	
    	
    	NoticeVO notice = service.noticeLoad(idx);
    	
    	List<NoticeFileVO> noitceFileList = new ArrayList<NoticeFileVO>();
    	if (notice.getFileVOList() != null) {
    		for (NoticeFileVO file : notice.getFileVOList()) {
    			if (file.getDel_YN() != null) {
    				if (file.getDel_YN() == false) {
        				noitceFileList.add(file);
        			}
				}
    		}
		}
    	
		model.addAttribute("notice", notice);
		
    	return "admin/board/noticeDetail.admin";
    }
    
    @RequestMapping(value="/download.do", method = RequestMethod.GET)
    public ModelAndView noticeFileDownload(@RequestParam("fileidx") String fileidx, @RequestParam("noticeidx") String noticeidx) throws Exception {
    	
    	int notice_idx = Integer.parseInt(noticeidx);
    	int file_idx = Integer.parseInt(fileidx);
    	NoticeVO notice = service.noticeLoad(notice_idx);
    	
    	String systemFileName = "";
    	String orgfileName = "";
    	
    	List<NoticeFileVO> noticeFile = notice.getFileVOList();
    	for (NoticeFileVO file : noticeFile) {
    		if (file_idx == file.getFile_idx()) {
    			systemFileName = file.getFilename();
    			orgfileName= file.getFilename_org();
			}
		}
    	
    	ModelAndView mav = new ModelAndView();
 
        mav.addObject("systemFileName", systemFileName);
        mav.addObject("orgFileName", orgfileName);
        mav.setViewName("downloadView");
        return mav;


    }
    
    @ResponseBody
	@RequestMapping(value="/ajaxfilelist.do", method = RequestMethod.GET)
    public Map<String, Object> ajaxFileList(NoticeVO noticeVO, @RequestParam(value="idx") String idx) throws Exception {
    	
    	int notice_idx = Integer.parseInt(idx);
    	noticeVO = service.noticeLoad(notice_idx);
    	
    	List<NoticeFileVO> noitceFileList = new ArrayList<NoticeFileVO>();
    	for (NoticeFileVO file : noticeVO.getFileVOList()) {
    		if (file.getDel_YN() != null) {
				if (file.getDel_YN() == false) {
    				noitceFileList.add(file);
    			}
			}
		}
    	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fileList", noitceFileList);
		
		return map;
    }
    
    @ResponseBody
	@RequestMapping(value="/ajaxfiledelete.do", method = RequestMethod.GET)
    public Map<String, Object> ajaxFileDelete(@RequestParam(value="fileidx") String idx) throws Exception {
    	
    	int file_idx = Integer.parseInt(idx);
    	service.noticeFileDelete(file_idx);
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("isSuccess", "true");
		return map;
    }
    
}
