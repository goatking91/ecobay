package org.ecobay.user.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;

@Controller
public class MailController {
	
	private static final Logger logger = LoggerFactory.getLogger(MailController.class);
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@RequestMapping(value = "/sendMail.do")
	public String sendMail() {

	    final MimeMessagePreparator preparator = new MimeMessagePreparator() {
	        @Override
	        public void prepare(MimeMessage mimeMessage) throws Exception {
	            final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
	            String from = "ecobaymaster@gmail.com";
	            String to = "ecobaymaster@gmail.com";
	            String subject = "메일테스트";
	            String text = "가입 축하 메일";
	            
	            helper.setFrom(from);
	            helper.setTo(to);
	            helper.setSubject(subject);
	            helper.setText(text, true);
	        }
	    };

	    mailSender.send(preparator);

	    return "main.page";
	}
	
}
