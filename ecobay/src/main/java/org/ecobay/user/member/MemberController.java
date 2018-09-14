package org.ecobay.user.member;

import org.ecobay.user.member.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RequestMapping("/member")
@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
    
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
    
    @RequestMapping("/join.do")
    public String join() {
    	return "member/join.page";
    }
    
    @RequestMapping("/mypage.do")
    public String mypage() {
    	return "member/mypage.page";
    }
    
}
