package org.ecobay.admin.board;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.ecobay.admin.board.domain.NoticeFileVO;
import org.ecobay.admin.board.domain.NoticeVO;
import org.ecobay.admin.board.service.BoardService;
import org.ecobay.user.util.UploadContoller;
import org.ecobay.user.util.UploadFileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/board")
public class AdminNoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadContoller.class);
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Autowired
	BoardService service;
	
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
    	for (NoticeFileVO file : noticeFile) {
    		file.setFileSizeByte(file.getFileSize() / 1024 );
		}
    	
		model.addAttribute("notice", notice);
		model.addAttribute("fileList", noticeFile);


		
    	return "admin/board/noticeDetail.admin";
    }
    
    @RequestMapping(value="/download.do", method = RequestMethod.GET)
    public ModelAndView noticeFileDownload(@RequestParam("fname") String fname, @RequestParam("fnameorg") String fnameOrg) throws Exception {
    	
    	ModelAndView mav = new ModelAndView();
 
        mav.addObject("systemFileName", fname);
        mav.addObject("orgFileName", fnameOrg);
        mav.setViewName("downloadView");
        return mav;


    }
    
    
}
