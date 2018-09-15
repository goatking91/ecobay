package org.ecobay.user.member;

import org.ecobay.user.member.domain.MemberVO;
import org.ecobay.user.member.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    
    @RequestMapping(value = "/create.do", method = RequestMethod.POST)
    public String join(MemberVO vo) throws Exception {
    	service.regist(vo);
    	return "redirect:/main.do";
    }
    
    @RequestMapping("/mypage.do")
    public String mypage() {
    	return "member/mypage.page";
    }
    
}
