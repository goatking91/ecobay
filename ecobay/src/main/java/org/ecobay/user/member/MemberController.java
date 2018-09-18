package org.ecobay.user.member;

import java.util.List;

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
    
    @RequestMapping("/join.do")
    public String join() {
    	return "member/join.page";
    }
    
    @RequestMapping("/list.do")
    public String listAll(Model model) throws Exception {
    	//admin 회원리스트
    	model.addAttribute("mcnt", service.count());
    	model.addAttribute("list", service.listAll());
    	return "member/list.page";
    }
    
    @RequestMapping("/detail.do")
    public void read(@RequestParam("member_id") String member_id) throws Exception {
    	//admin 상세보기 회원한명에대한 상세
    	
    	MemberVO vo = service.read(member_id);
    }
    
    @RequestMapping("/mypage.do")
    public String mypage(@RequestParam("member_id") String member_id, Model model) throws Exception {
    	model.addAttribute("member",service.read(member_id));
    	MemberVO vo = service.read(member_id);
    	System.out.println(vo.toString());
    	return "member/mypage.page";
    }
    
    @RequestMapping(value = "/create.do", method = RequestMethod.POST)
    public String join(MemberVO vo) throws Exception {
    	service.regist(vo);
    	return "redirect:/main.do";
    }
    
    @RequestMapping(value = "/update.do", method = RequestMethod.GET)
    public String preupdate(@RequestParam("member_id") String member_id, Model model) throws Exception {
    	model.addAttribute("member", service.read(member_id));
    	return "member/update.page";
    }
    
    @RequestMapping(value = "/update.do", method = RequestMethod.POST)
    public String update(MemberVO vo) throws Exception {
    	
    	service.modify(vo);
    	return "redirect:/member/mypage.do?member_id=" + vo.getMember_id();
    }
    
    @RequestMapping(value = "/delete.do", method = RequestMethod.POST)
    public void delete(@RequestParam("member_id") String member_id) throws Exception {//회원탈퇴
    	service.delete(member_id);
    }
}
