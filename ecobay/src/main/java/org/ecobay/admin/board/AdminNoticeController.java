package org.ecobay.admin.board;

import org.ecobay.admin.board.domain.FaqVO;
import org.ecobay.admin.board.domain.NoticeVO;
import org.ecobay.admin.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/board")
public class AdminNoticeController {
	
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
		
		model.addAttribute("notice", service.noticeLoad(idx));
		
        return "admin/board/noticeModify.admin";
    }
	
    @RequestMapping(value="/noticemod.do", method = RequestMethod.POST)
    public String noticeModPOST(NoticeVO vo) throws Exception {
    	System.out.println("컨트롤러"+vo.getNotice_idx());
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
		model.addAttribute("notice", service.noticeLoad(idx));
		
    	return "admin/board/noticeDetail.admin";
    }
}
