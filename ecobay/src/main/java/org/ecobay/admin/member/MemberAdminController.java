package org.ecobay.admin.member;

import org.ecobay.admin.member.service.MemberAdminService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class MemberAdminController {
	
	@Autowired
	MemberAdminService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberAdminController.class);
	
	@RequestMapping(value="/memberlist.do", method = RequestMethod.GET)
    public String memberList(Model model) throws Exception {
    	//admin 회원리스트
    	model.addAttribute("mcnt", service.count());
    	model.addAttribute("list", service.listAll());
    	return "admin/memberList.admin";
    }
	
}
