package org.ecobay.admin.main;

import org.ecobay.admin.main.domain.StatsVO;
import org.ecobay.admin.main.service.StatsAdminService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminMainController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminMainController.class);
	
	@Autowired
	StatsAdminService statsAdminService;
	
	@RequestMapping(value="/main.do", method = RequestMethod.GET)
    public String main(Model model, StatsVO svo) throws Exception {
	
		model.addAttribute("memberJoinDays", statsAdminService.memberJoinDays(svo));
		model.addAttribute("memberJoinDaysM", statsAdminService.memberJoinDaysM(svo));
		model.addAttribute("memberJoinDaysF", statsAdminService.memberJoinDaysF(svo));
		model.addAttribute("productPayState", statsAdminService.productPayState(svo));
		model.addAttribute("productState", statsAdminService.productState(svo));
		
        return "admin/main.admin";
    }
	
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
    public String login() {
    	return "admin/login.admin";
    }
}
