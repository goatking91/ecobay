package org.ecobay.admin.board;

import org.ecobay.admin.board.domain.FaqVO;
import org.ecobay.admin.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class FaqController {
	
	@Autowired
	BoardService service;
	
	@RequestMapping(value="/faqlist.do", method = RequestMethod.GET)
    public String faqList(Model model) throws Exception {
		model.addAttribute("faqList", service.faqList());
        return "admin/board/faqList.admin";
    }
	
	@RequestMapping(value="/faqreg.do", method = RequestMethod.GET)
    public String faqRegGET() {
        return "admin/board/faqRegister.admin";
    }
	
	@RequestMapping(value="/faqreg.do", method = RequestMethod.POST)
    public String faqRegPOST(FaqVO vo) throws Exception {
		service.FaqRegist(vo);
		
        return "redirect:/admin/faqlist.do";
    }
	
}
