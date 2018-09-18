package org.ecobay.user.member;

import org.ecobay.user.member.domain.MemberVO;
import org.ecobay.user.member.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@RequestMapping("/member")
@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
    
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
    
    @RequestMapping(value="/reg.do", method = RequestMethod.GET)
    public String regGET() {
    	return "member/register.page";
    }
    
    @RequestMapping(value="/list.do", method = RequestMethod.GET)
    public String list(Model model) throws Exception {
    	//admin 회원리스트
    	model.addAttribute("mcnt", service.count());
    	model.addAttribute("list", service.listAll());
    	return "member/list.page";
    }
    
    @RequestMapping(value="/detail.do", method = RequestMethod.GET)
    public void read(@RequestParam("member_id") String member_id) throws Exception {
    	//admin 상세보기 회원한명에대한 상세
    	
    	MemberVO vo = service.read(member_id);
    }
    
    @RequestMapping(value="/mypage.do", method = RequestMethod.GET)
    public String mypage(@RequestParam("member_id") String member_id, Model model) throws Exception {
    	model.addAttribute("member",service.read(member_id));
    	MemberVO vo = service.read(member_id);
    	System.out.println(vo.toString());
    	return "member/mypage.page";
    }
    
    @RequestMapping(value = "/reg.do", method = RequestMethod.POST)
    public String regPOST(MemberVO vo) throws Exception {
    	service.regist(vo);
    	return "redirect:/main.do";
    }
    
    @RequestMapping(value = "/modify.do", method = RequestMethod.GET)
    public String modifyGET(@RequestParam("member_id") String member_id, Model model) throws Exception {
    	model.addAttribute("member", service.read(member_id));
    	return "member/modify.page";
    }
    
    @RequestMapping(value = "/modify.do", method = RequestMethod.POST)
    public String modifyPOST(MemberVO vo) throws Exception {
    	
    	service.modify(vo);
    	return "redirect:/member/mypage.do?member_id=" + vo.getMember_id();
    }
    
    @RequestMapping(value = "/delete.do", method = RequestMethod.POST)
    public void delete(@RequestParam("member_id") String member_id) throws Exception {//회원탈퇴
    	service.delete(member_id);
    }
}
