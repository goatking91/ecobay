package org.ecobay.user.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/notice")
public class NoticeController {
	
	@RequestMapping("/list.do")
    public String list() {
    	return "board/notice/list.page";
    }

    @RequestMapping("/register.do")
    public String resgiter() {
    	return "board/notice/register.page";
    }
    
    @RequestMapping("/detail.do")
    public String detail() {
    	return "board/notice/detail.page";
    }
}
