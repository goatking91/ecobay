package org.ecobay.user.member;

import java.util.HashMap;
import java.util.Map;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;

import org.ecobay.user.member.domain.MemberVO;
import org.ecobay.user.member.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    
    @RequestMapping(value = "/payment.do", method = RequestMethod.GET)
    public String paymentGET() {
    	return "member/payment.page";
    }
/*    @RequestMapping(value = "/payment.do", method = RequestMethod.POST)
    public String paymentPOST() {
    	return "member/mailCheck.page";
    }*/
    @RequestMapping(value = "/paymentEnd.do", method = RequestMethod.GET)
    public String paymentEndGET() {
    	return "member/paymentEnd.page";
    }
    
    
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
    public String regPOST(MemberVO vo) throws Exception {
    	service.regist(vo);
    	/*final MimeMessagePreparator preparator = new MimeMessagePreparator() {
	        @Override
	        public void prepare(MimeMessage mimeMessage) throws Exception {
	            final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
	            
	            StringBuffer sb = new StringBuffer();
	            
	            String from = "ecobaymasters@gmail.com";
	            String to = vo.getMember_id();
	            String subject = "ECObay 가입 확인 메일";
	            sb.append("<h1>이메일인증<h1>");
	            sb.append("<img src=\"cid:mail\">");
	            sb.append("<img src='http://d1841mjet2hm8m.cloudfront.net/thumb-900/fr_1099/1620/97/f9e3e5c5e832618903369bfe3b327413.jpg'>");
	            sb.append("<h4>"+vo.getMember_name()+"님, 안녕하세요.<br>"
	            		+ "ECObay 회원이 되신 것을 축하드립니다!<br>"
	            		+ "이메일 인증을 하지 않을 경우 사이트 이용이 제한되오니<br>"
	            		+ "번거로우시더라도 아래 이메일 인증하기 버튼을 클릭하셔서<br>"
	            		+ "인증절차를 완료해 주시기 바랍니다<h4>");
	            sb.append("<a href='http://localhost:7080/member/verify.do?member_id=" + vo.getMember_id()
					+"&birth=" + vo.getBirth());
				sb.append("' target='blank'>이메일 인증 확인 </a>");    
				
				String text = sb.toString();
				
				FileDataSource fds = new FileDataSource(new File("/resources/images/mail.png"));
	            DataHandler dh = new DataHandler(fds);
				Header hd = new Header("Content-ID","mail");
	            
	            helper.setFrom(from);
	            helper.setTo(to);
	            helper.setSubject(subject);
	            helper.setText(text, true);
	        }
	    };

	    mailSender.send(preparator);*/
    	mailSender.send(getMimeMessage(mailSender.getSession(), vo));

	    
    	return "member/mailCheck.page";
    }
    private MimeMessage getMimeMessage(Session session, MemberVO vo) throws Exception {
        MimeMessage message = new MimeMessage(session);
            message.setSubject("ECObay 가입 확인 메일","utf-8");
            message.setRecipient(RecipientType.TO, new InternetAddress(vo.getMember_id()));

            //
            // This HTML mail have to 2 part, the BODY and the embedded image
            //
            MimeMultipart multipart = new MimeMultipart("related");

            // first part  (the html)
            BodyPart messageBodyPart = new MimeBodyPart();
            
            String htmlText = "";
            htmlText += "<H1>이메일인증</H1><img style='width:15%;' src=\"cid:image\">"; 
            htmlText += "<h4>"+vo.getMember_name() + "님, 안녕하세요.<br>ECObay 회원이 되신 것을 축하드립니다!<br>";
            htmlText += "이메일 인증을 하지 않을 경우 사이트 이용이 제한되오니<br>";
            htmlText += "번거로우시더라도 아래 이메일 인증하기 버튼을 클릭하셔서<br>";
            htmlText += "인증절차를 완료해 주시기 바랍니다</h4>";
            htmlText += "<a href='http://localhost:7080/member/verify.do?member_id=" + vo.getMember_id() + "&birth=" + vo.getBirth();
            htmlText += "' target='blank'><button style='background-color:#007bff;border-color:#007bff;color:white;font-size:16pt;'>이메일 인증 확인</button> </a>";			

            messageBodyPart.setContent(htmlText, "text/html;charset=utf-8");

            // add it
            multipart.addBodyPart(messageBodyPart);
            
            // second part (the image)
            messageBodyPart = new MimeBodyPart();
            DataSource fds = new FileDataSource("../../mail.png");
            messageBodyPart.setDataHandler(new DataHandler(fds));
            messageBodyPart.setHeader("Content-ID","<image>");

            // add it
            multipart.addBodyPart(messageBodyPart);

            // put everything together
            message.setContent(multipart);
        
        return message;
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
