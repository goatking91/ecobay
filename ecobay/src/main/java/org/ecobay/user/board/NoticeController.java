package org.ecobay.user.board;

import java.util.List;

import org.ecobay.admin.board.domain.NoticeFileVO;
import org.ecobay.admin.board.domain.NoticeVO;
import org.ecobay.user.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/support/notice")
public class NoticeController {
	
	@Autowired
	BoardService service;
	
	@RequestMapping(value="/noticelist.do", method = RequestMethod.GET)
    public String noticeList(Model model) throws Exception {
		model.addAttribute("noticeList", service.noticeList());
		return "support/noticeList.page";
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
