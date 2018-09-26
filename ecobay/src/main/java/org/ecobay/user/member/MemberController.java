package org.ecobay.user.member;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.ecobay.user.member.domain.MemberVO;
import org.ecobay.user.member.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@RequestMapping("/member")
@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
    
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
    
    @RequestMapping(value = "/idcheck.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<Object, Object> idcheck(@RequestBody String member_id) throws Exception {
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
        count = service.idcheck(member_id);
        map.put("cnt", count);
        return map;
    }
    
    @RequestMapping(value="/join.do", method = RequestMethod.GET)
    public String joinGET() {
    	return "member/join.page";
    }
    
    @RequestMapping(value="/reg.do", method = RequestMethod.GET)
    public String regGET() {
    	return "member/register.page";
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
	            String to = vo.getMember_id();
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
    
    
    @RequestMapping(value="/detail.do", method = RequestMethod.GET)
    public void read(@RequestParam("member_id") String member_id) throws Exception {
    	//admin 상세보기 회원한명에대한 상세
    	
    	MemberVO vo = service.read(member_id);
    }
    
    @RequestMapping(value="/mypage.do", method = RequestMethod.GET)
    public String mypage(Model model) throws Exception {
    	User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	
    	model.addAttribute("member",service.read(user.getUsername()));
    	MemberVO vo = service.read(user.getUsername());
    	System.out.println(vo.toString());
    	return "member/mypage.page";
    }    
    

    
    @ResponseBody
    @RequestMapping(value="/idfind.do", method = RequestMethod.POST)
    public Map<String, Object> idfind(@RequestBody Map<String, Object> postData ) throws Exception{
    	MemberVO vo = new MemberVO();
    	vo.setMember_name(postData.get("member_name").toString());
    	vo.setBirth(postData.get("birth").toString());
    	vo.setPhone(postData.get("phone").toString());
    	Map<String, Object> map = new HashMap<String, Object>();
    	if(service.idfind(vo) == null || service.idfind(vo) == "") {
    		map.put("member_id", "");
    	}else {
    		map.put("member_id", service.idfind(vo));
    	}
    	return map;
    }
        
    
    @ResponseBody
    @RequestMapping(value="/pwdcheck.do", method = RequestMethod.POST)
    public Map<String, Object> pwdcheck(@RequestBody String pwd) throws Exception{
    	User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("member_id", user.getUsername());
    	map.put("flag", service.pwdcheck(user.getUsername(), pwd));
    	return map;
    }
    
    @ResponseBody
    @RequestMapping(value="/pwdfind.do", method = RequestMethod.POST)
    public Map<String, Object> pwdfind(@RequestBody Map<String, Object> postData ) throws Exception{
    	MemberVO vo = new MemberVO();
    	vo.setMember_id(postData.get("member_id").toString());
    	vo.setMember_name(postData.get("member_name").toString());
    	vo.setBirth(postData.get("birth").toString());
    	Map<String, Object> map = new HashMap<String, Object>();
    	if(service.pwdfind(vo) == null || service.pwdfind(vo) == "") {
    		map.put("pwd", "");
    	}else {
    		map.put("pwd", service.pwdfind(vo));
    		map.put("member_id", postData.get("member_id").toString());
    	}
    	return map;
    }
    
    
    @ResponseBody
    @RequestMapping(value = "/newpwd.do", method = RequestMethod.POST)
    public String newpwd(MemberVO vo1) throws Exception{
    	MemberVO vo = new MemberVO();
    	vo.setMember_id(vo1.getMember_id());
    	vo.setPwd(vo1.getPwd());
    	service.newpwd(vo);
    	System.out.println("member_id=" + vo.getMember_id() + "pwd="+ vo.getPwd());
    	return "login.part";
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
