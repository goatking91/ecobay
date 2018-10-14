package org.ecobay.user.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ecobay.admin.board.domain.NoticeFileVO;
import org.ecobay.admin.board.domain.NoticeVO;
import org.ecobay.user.board.service.BoardService;
import org.ecobay.user.util.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/support/notice")
public class NoticeController {
	
	@Autowired
	BoardService service;
	
	@RequestMapping(value="/noticelist.do", method = RequestMethod.GET)
    public String noticeList(NoticeVO noticeVO, @RequestParam(defaultValue="1") int curPage, Model model) throws Exception {
		
		int listCnt = service.selectNoticeListCnt(noticeVO);
		
		Pagination pagination = new Pagination(listCnt, curPage);
		
		noticeVO.setStartIndex(pagination.getStartIndex());
		noticeVO.setCntPerPage(pagination.getPageSize());
		
		model.addAttribute("noticeList", service.noticeList(noticeVO));
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pagination", pagination);
		
		return "support/noticeList.page";
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
    
    @RequestMapping("/detail.do")
    public String detail() {
    	return "board/notice/detail.page";
    }
    
    @RequestMapping(value="/noticedetail.do", method = RequestMethod.GET)
    public String noticeDetailGET(@RequestParam("idx") String notice_idx, Model model) throws Exception {
    	
    	int idx = Integer.parseInt(notice_idx);
    	service.noticeViewCnt(idx);
    	NoticeVO notice = service.noticeLoad(idx);
    	
    	List<NoticeFileVO> noticeFile = notice.getFileVOList();
    	
		model.addAttribute("notice", notice);
		model.addAttribute("fileList", noticeFile);


		
    	return "support/noticeDetail.page";
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
}
