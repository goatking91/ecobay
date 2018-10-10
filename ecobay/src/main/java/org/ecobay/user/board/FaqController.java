package org.ecobay.user.board;

import org.ecobay.admin.board.domain.QnaVO;
import org.ecobay.user.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/support/faq")
public class FaqController {
	
	@Autowired
	BoardService service;
	
	@RequestMapping(value="/qnareg.do", method = RequestMethod.GET)
    public String qnaRegGET() {
    	return "support/qnaRegister.page";
    }
	
	@RequestMapping(value="/qnareg.do", method = RequestMethod.POST)
    public String qnaRegPOST(QnaVO vo) throws Exception {
    	User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	vo.setMember_id(user.getUsername());
    	service.qnaRegist(vo);
    	
    	return "redirect:/support.do";
    }
	
	@RequestMapping(value="/faqlist.do", method = RequestMethod.GET)
    public String faqList(Model model) throws Exception {
		model.addAttribute("faqList", service.faqList());
        return "support/faqList.page";
    }
    
}
