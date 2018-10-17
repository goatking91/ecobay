package org.ecobay.user.member;

import java.util.HashMap;
import java.util.List;
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
import javax.servlet.ServletContext;

import org.ecobay.user.member.domain.MemberProductVO;
import org.ecobay.user.member.domain.MemberQnaVO;
import org.ecobay.user.member.domain.MemberVO;
import org.ecobay.user.member.service.MemberService;
import org.ecobay.user.product.domain.AuctionInfoVO;
import org.ecobay.user.product.domain.DeliveryVO;
import org.ecobay.user.product.domain.PaymentVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
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
    
	@Autowired
	private ServletContext context;
	
	private final int pcount = 1;
	
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
   
    
    @ResponseBody
    @RequestMapping(value = "/stateChange.do", method = RequestMethod.POST)
    public void stateChangePOST(@RequestBody String product_cd) throws Exception {
    	service.stateChange(product_cd);
    }
    
    @ResponseBody
    @RequestMapping(value = "/checkDel.do", method = RequestMethod.POST)
    public ResponseEntity<String> checkDelPOST(@RequestBody Object product_cd) throws Exception {
    	List<String> list = (List<String>) product_cd;
    	
    	ResponseEntity<String> entity = null;
    	try {
    		service.chkDel(list);
    		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    	} catch (Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>(ex.getMessage(), HttpStatus.BAD_REQUEST);
		}
    	
    	return entity;
    }
    
    @RequestMapping(value = "/payment.do/{product_cd}/{flag}", method = RequestMethod.GET)
    public String paymentGET(@PathVariable("product_cd") String product_cd, @PathVariable("flag") int flag, Model model) throws Exception{
    	User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	String userid = user.getUsername();
    	
    	AuctionInfoVO auctVO = service.selectAuct(product_cd);
    	
    	String prodcd = auctVO.getProduct_cd();
    	
    	long payMoney = 0;
    	
    	int deliveryInfo = service.deliveryInfo(product_cd);
    	
    	// flag = 즉시구매(1) / 낙찰(2)
    	if(flag == 1) {
    		payMoney = auctVO.getBaynow_money();
    	}
    	else if(flag == 2) {
    		payMoney = auctVO.getMoney_last();
    	}
    	
		model.addAttribute("member", service.read(userid));
    	model.addAttribute("auct", auctVO);
    	model.addAttribute("payMoney", payMoney);
    	model.addAttribute("product", service.selectprod(prodcd));
    	model.addAttribute("img", service.selectimg(prodcd));
    	model.addAttribute("deliveryInfo", deliveryInfo);
    	
    	if(deliveryInfo == 1) {
    		model.addAttribute("prodMember", service.selectProdMember(prodcd));
    	}

    	return "member/payment.page";
    }
    @RequestMapping(value = "/payment.do/{product_cd}/{flag}", method = RequestMethod.POST)
    public String paymentPOST(PaymentVO pvo, DeliveryVO dvo, @PathVariable("product_cd") String product_cd, @PathVariable("flag") int flag) throws Exception {
    	User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	
    	String userid = user.getUsername();
    	long payMoney = pvo.getMoney_pay(); 	
    	AuctionInfoVO auctVO = new AuctionInfoVO();
    	auctVO.setProduct_cd(product_cd);
    	auctVO.setBay_member_id(userid);
    	auctVO.setMoney_last(payMoney);
    	
    	int deliveryInfo = service.deliveryInfo(product_cd);
    	
    	String retVal = service.paymentPrs(pvo, dvo, auctVO, deliveryInfo, flag);
    	
    	//오류시 ERR return
    	if(retVal == "OK") {
        	mailSender.send(getMimeMessage2(mailSender.getSession(), userid));
    	} 	
    	return "member/mailCheckOrder.page";
    }  

    
    @ResponseBody
    @RequestMapping(value = "/wishList.do/{page}", method = RequestMethod.POST)
    public Map<String, Object> wishListPOST(@RequestBody String member_id, @PathVariable("page") int page, MemberProductVO vo) throws Exception{
    	int total = service.wishTotal(member_id);
    	int pagecount = 0;
    	if(total%10 == 0) {
    		pagecount = total/10;
    	} else {
    		pagecount = (total/10) +1;
    	}
    	vo.setPagecount(pagecount);
    	System.out.println("total="+total);
    	vo.setPage(page);
		vo.setStart(((page-1)*10)+1);
		vo.setEnd(page*10);
		vo.setTemp((page-1)%10);
		vo.setStartpage(page - vo.getTemp());
		if(vo.getStartpage() + 9 > pagecount) { vo.setEndpage(pagecount); }
		else {
			vo.setEndpage(vo.getStartpage() + 9);
		}
		vo.setMember_id(member_id);

    	Map<String, Object> map = new HashMap<String, Object>();
    	List<MemberProductVO> wishList = service.wishList(vo);

    	map.put("vo", vo);
    	map.put("cnt", total);
    	map.put("arr", wishList);

    	return map;
    }
    
    @ResponseBody
    @RequestMapping(value = "/buyList.do/{page}", method = RequestMethod.POST)
    public Map<String, Object> buyListPOST(@RequestBody String member_id, @PathVariable("page") int page, MemberProductVO vo) throws Exception{
    	
    	int total = service.buyCnt(member_id);
    	int pagecount = 0;
    	
    	if(total%10 == 0) {
    		pagecount = total/10;
    	} else {
    		pagecount = (total/10) +1;
    	}
    	vo.setPagecount(pagecount);
    	vo.setPage(page);
		vo.setStart(((page-1)*10)+1);
		vo.setEnd(page*10);
		vo.setTemp((page-1)%10);
		vo.setStartpage(page - vo.getTemp());
		if(vo.getStartpage() + 9 > pagecount) { vo.setEndpage(pagecount); }
		else {
			vo.setEndpage(vo.getStartpage() + 9);
		}
		vo.setMember_id(member_id);
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	List<MemberProductVO> buyList = service.buyList(vo);

    	map.put("vo", vo);
    	map.put("cnt", total);
    	map.put("arr", buyList);

    	return map;
    }
    
    @ResponseBody
    @RequestMapping(value = "/sellList.do/{page}", method = RequestMethod.POST)
    public Map<String, Object> sellListPOST(@RequestBody String member_id, @PathVariable("page") int page, MemberProductVO vo) throws Exception{
    	
    	int total = service.sellCnt(member_id);
    	int pagecount = 0;
    	
    	if(total%10 == 0) {
    		pagecount = total/10;
    	} else {
    		pagecount = (total/10) +1;
    	}
    	vo.setPagecount(pagecount);
    	System.out.println("total="+total);
    	vo.setPage(page);
		vo.setStart(((page-1)*10)+1);
		vo.setEnd(page*10);
		vo.setTemp((page-1)%10);
		vo.setStartpage(page - vo.getTemp());
		if(vo.getStartpage() + 9 > pagecount) { vo.setEndpage(pagecount); }
		else {
			vo.setEndpage(vo.getStartpage() + 9);
		}
		vo.setMember_id(member_id);
    
    	Map<String, Object> map = new HashMap<String, Object>();
    	List<MemberProductVO> sellList = service.sellList(vo);
    	map.put("vo", vo);
    	map.put("cnt", total);
    	map.put("arr", sellList);

    	return map;
    }
    
    @ResponseBody
    @RequestMapping(value = "/qnaList.do/{page}", method = RequestMethod.POST)
    public Map<String, Object> qnaListPOST(@RequestBody String member_id, @PathVariable("page") int page, MemberQnaVO vo) throws Exception{
    	
    	int total = service.qnaCnt(member_id);
    	int pagecount = 0;
    	
    	if(total%10 == 0) {
    		pagecount = total/10;
    	} else {
    		pagecount = (total/10) +1;
    	}
    	vo.setPagecount(pagecount);
    	vo.setPage(page);
		vo.setStart(((page-1)*10)+1);
		vo.setEnd(page*10);
		vo.setTemp((page-1)%10);
		vo.setStartpage(page - vo.getTemp());
		if(vo.getStartpage() + 9 > pagecount) { vo.setEndpage(pagecount); }
		else {
			vo.setEndpage(vo.getStartpage() + 9);
		}
		vo.setMember_id(member_id);
    
    	Map<String, Object> map = new HashMap<String, Object>();
    	List<MemberQnaVO> qnaList = service.qnaList(vo);
    	
    	System.out.println("qnaList=" + qnaList);
    	map.put("vo", vo);
    	map.put("cnt", total);
    	map.put("arr", qnaList);

    	return map;
    }
    
    private MimeMessage getMimeMessage2(Session session, String member_id) throws Exception {
        MimeMessage message = new MimeMessage(session);
            message.setSubject("ECObay 결제완료 메일","utf-8");
            message.setRecipient(RecipientType.TO, new InternetAddress(member_id));

            //
            // This HTML mail have to 2 part, the BODY and the embedded image
            //
            MimeMultipart multipart = new MimeMultipart("related");

            // first part  (the html)
            BodyPart messageBodyPart = new MimeBodyPart();
            
            String htmlText = "";
            htmlText += "<H1>결제완료</H1><img style='width:15%;' src=\"cid:image\">"; 
            htmlText += "<h4>"+member_id + "님, 안녕하세요.<br>ECObay 주문결제가 완료되었습니다<br>";
            htmlText += "이용해주셔서 감사합니다<br>";
            
            messageBodyPart.setContent(htmlText, "text/html;charset=utf-8");

            // add it
            multipart.addBodyPart(messageBodyPart);
            
            // second part (the image)
            messageBodyPart = new MimeBodyPart();
            DataSource fds = new FileDataSource(context.getRealPath("/resources/images/mail.png"));//resources/images/mail.png
            messageBodyPart.setDataHandler(new DataHandler(fds));
            messageBodyPart.setHeader("Content-ID","<image>");
 
            
            // add it
            multipart.addBodyPart(messageBodyPart);

            // put everything together
            message.setContent(multipart);
        
        return message;
    }
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
    @RequestMapping(value = "/mailcheck.do", method = RequestMethod.GET)
    public String mailcheckGET() {
    	return "member/mailCheck.Mypage";
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
            //htmlText += "<a href='http://13.125.157.90:8080/member/verify.do?member_id=" + vo.getMember_id() + "&birth=" + vo.getBirth();
            htmlText += "' target='blank'><button style='background-color:#007bff;border-color:#007bff;color:white;font-size:16pt;'>이메일 인증 확인</button> </a>";			

            messageBodyPart.setContent(htmlText, "text/html;charset=utf-8");

            // add it
            multipart.addBodyPart(messageBodyPart);
            
            // second part (the image)
            messageBodyPart = new MimeBodyPart();
            DataSource fds = new FileDataSource(context.getRealPath("/resources/images/mail.png"));//resources/images/mail.png
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
    
    
    @ResponseBody
    @RequestMapping(value = "/delete.do", method = RequestMethod.POST)
    public ResponseEntity<String> delete(@RequestBody String member_id) throws Exception {//회원탈퇴
    	/*service.delete(member_id);*/
    	
    	ResponseEntity<String> entity = null;
    	try {
    		service.delete(member_id);
    		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    	} catch (Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>(ex.getMessage(), HttpStatus.BAD_REQUEST);
		}
    	
    	return entity;
    }
}
