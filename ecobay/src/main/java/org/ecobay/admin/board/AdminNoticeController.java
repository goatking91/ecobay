package org.ecobay.admin.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/board")
public class AdminNoticeController {
	
	@RequestMapping("/noticelist.do")
    public String noticeList() {
    	return "admin/board/noticeList.admin";
    }

    @RequestMapping("/noticereg.do")
    public String noticeRegGET() {
    	return "admin/board/noticeRegister.admin";
    }
    
    @RequestMapping("/noticedetail.do")
    public String noticeDetail() {
    	return "admin/board/noticeDetail.admin";
    }
}
