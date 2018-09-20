package org.ecobay.admin.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminMainController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminMainController.class);
	
	@RequestMapping(value="/main.do", method = RequestMethod.GET)
    public String main() {
        return "/admin/main.admin";
    }
	
}
