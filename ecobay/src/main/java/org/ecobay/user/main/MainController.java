package org.ecobay.user.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value="/main.do", method = RequestMethod.GET)
    public String main() {
        return "main.page";
    }
	
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
    public String login() {
    	return "login.part";
    }
	
}
