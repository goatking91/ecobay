package org.ecobay.admin.board;

import java.util.List;

import org.ecobay.admin.board.domain.CategoryVO;
import org.ecobay.admin.board.domain.FaqVO;
import org.ecobay.admin.board.persistence.CategoryAdminDAO;
import org.ecobay.admin.board.service.BoardAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/board")
public class FaqAdminController {
	
	@Autowired
	BoardAdminService service;
	
	@Autowired
	private CategoryAdminDAO categoryAdminDAO;
	
	@RequestMapping(value="/faqlist.do", method = RequestMethod.GET)
    public String faqList(Model model) throws Exception {
		model.addAttribute("faqList", service.faqList());
        return "admin/board/faqList.admin";
    }
	
	@RequestMapping(value="/faqreg.do", method = RequestMethod.GET)
    public String faqRegGET(Model model) throws Exception {
		
		List<CategoryVO> categorys = categoryAdminDAO.categoryList();

		model.addAttribute("categorys",categorys);
        return "admin/board/faqRegister.admin";
    }
	
	@RequestMapping(value="/faqreg.do", method = RequestMethod.POST)
    public String faqRegPOST(FaqVO faqVO, CategoryVO categoryVO) throws Exception {
		
		categoryVO = categoryAdminDAO.categoryLoad(categoryVO.getCategory_cd());
		faqVO.setCategory(categoryVO);
		service.faqRegist(faqVO);
		
        return "redirect:/admin/board/faqlist.do";
    }
	
	
	@RequestMapping(value="/faqmod.do", method = RequestMethod.GET)
    public String faqModGET(@RequestParam("idx") String faq_idx, Model model) throws Exception {
		
		int idx = Integer.parseInt(faq_idx);
		
		model.addAttribute("faq", service.faqLoad(idx));
		
        return "admin/board/faqModify.admin";
    }
	
	@RequestMapping(value="/faqmod.do", method = RequestMethod.POST)
    public String faqModPOST(FaqVO vo) throws Exception {
		service.faqUpdate(vo);
		
        return "redirect:/admin/board/faqlist.do";
    }
	
	@RequestMapping(value="/faqdel.do", method = RequestMethod.GET)
    public String faqDelGet(@RequestParam("idx") String faq_idx) throws Exception {
		int idx = Integer.parseInt(faq_idx);
		
		service.faqDelete(idx);
		
        return "redirect:/admin/board/faqlist.do";
    }
	
}
