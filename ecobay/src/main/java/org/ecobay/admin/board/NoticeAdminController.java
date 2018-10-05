package org.ecobay.admin.board;

import java.util.List;

import javax.annotation.Resource;

import org.ecobay.admin.board.domain.NoticeFileVO;
import org.ecobay.admin.board.domain.NoticeVO;
import org.ecobay.admin.board.service.BoardAdminService;
import org.ecobay.user.util.UploadContoller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
    public String noticeList(Model model) throws Exception {
		model.addAttribute("noticeList", service.noticeList());
		return "admin/board/noticeList.admin";
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
		List<NoticeFileVO> noticeFile = notice.getFileVOList();
		
		model.addAttribute("notice", notice);
		model.addAttribute("fileList", noticeFile);
		
        return "admin/board/noticeModify.admin";
    }
	
    @RequestMapping(value="/noticemod.do", method = RequestMethod.POST)
    public String noticeModPOST(NoticeVO vo) throws Exception {
		service.noticeUpdate(vo);
		
        return "redirect:/admin/board/noticelist.do";
    }
	
	@RequestMapping(value="/noticedel.do", method = RequestMethod.GET)
    public String faqDelGet(@RequestParam("idx") String notice_idx) throws Exception {
		int idx = Integer.parseInt(notice_idx);
		
		service.noticeDelete(idx);
		
        return "redirect:/admin/board/noticelist.do";
    }
	
	
	
    
    @RequestMapping(value="/noticedetail.do", method = RequestMethod.GET)
    public String noticeDetailGET(@RequestParam("idx") String notice_idx, Model model) throws Exception {
    	
    	int idx = Integer.parseInt(notice_idx);
    	service.noticeViewCnt(idx);
    	NoticeVO notice = service.noticeLoad(idx);
    	
    	
    	List<NoticeFileVO> noticeFile = notice.getFileVOList();
    	
		model.addAttribute("notice", notice);
		model.addAttribute("fileList", noticeFile);


		
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
    
    
}
