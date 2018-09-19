package org.ecobay.user.member;

import javax.mail.internet.MimeMessage;

import org.ecobay.user.member.domain.MemberVO;
import org.ecobay.user.member.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
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
	
	@Autowired
	private JavaMailSenderImpl mailSender;
    
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
    
    
    @RequestMapping(value="/join.do", method = RequestMethod.GET)
    public String joinGET() {
    	return "member/join.page";
    }
    
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
    public String regPOST(final MemberVO vo) throws Exception {
    	service.regist(vo);
    	
    	final MimeMessagePreparator preparator = new MimeMessagePreparator() {
	        @Override
	        public void prepare(MimeMessage mimeMessage) throws Exception {
	            final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
	            StringBuffer sb = new StringBuffer();
	            
	            String from = "ecobaymasters@gmail.com";
	            String to = vo.getMember_id()+"@gmail.com";
	            String subject = "ECObay 가입 확인 메일";
	            sb.append("<h1>메일인증<h1>");
				sb.append("<a href='http://localhost:7080/member/verify.do?member_id=" + vo.getMember_id()
					+"&birth=" + vo.getBirth());
				sb.append("' target='blank'>이메일 인증 확인 </a>");      
				
				String text = sb.toString();
				
	            helper.setFrom(from);
	            helper.setTo(to);
	            helper.setSubject(subject);
	            helper.setText(text, true);
	        }
	    };

	    mailSender.send(preparator);
	    
    	return "member/mailCheck.page";
    }
    
    @RequestMapping(value="/verify.do", method = RequestMethod.GET)
    public String verify(@RequestParam String member_id, @RequestParam String birth) throws Exception {
    	MemberVO vo = new MemberVO();
    	vo.setMember_id(member_id);
    	vo.setBirth(birth);
    	service.verify(vo);
    	return "main.page";
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
