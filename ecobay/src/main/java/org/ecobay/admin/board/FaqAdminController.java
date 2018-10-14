package org.ecobay.admin.board;

import java.util.HashMap;
import java.util.Map;

import org.ecobay.admin.board.domain.CategoryVO;
import org.ecobay.admin.board.domain.FaqVO;
import org.ecobay.admin.board.persistence.CategoryAdminDAO;
import org.ecobay.admin.board.service.BoardAdminService;
import org.ecobay.user.util.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/board")
public class FaqAdminController {
	
	@Autowired
	BoardAdminService service;
	
	@Autowired
	private CategoryAdminDAO categoryAdminDAO;
	
	@RequestMapping(value="/faqlist.do", method = RequestMethod.GET)
    public String faqList(FaqVO faqVO, @RequestParam(defaultValue="1") int curPage, Model model) throws Exception {
		faqVO.setCategoryCode("");
		int listCnt = service.selectFaqListCnt(faqVO);
		Pagination pagination = new Pagination(listCnt, curPage);
		
		faqVO.setStartIndex(pagination.getStartIndex());
		faqVO.setCntPerPage(pagination.getPageSize());
		
		model.addAttribute("faqList", service.faqList(faqVO));
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pagination", pagination);
		model.addAttribute("categorys",categoryAdminDAO.categoryList());
		
        return "admin/board/faqList.admin";
    }
	
	@RequestMapping(value="/faqreg.do", method = RequestMethod.GET)
    public String faqRegGET(Model model) throws Exception {
		model.addAttribute("categorys",categoryAdminDAO.categoryList());
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
	
	@ResponseBody
	@RequestMapping(value="/ajaxfaqlist.do", method = RequestMethod.GET)
    public Map<String, Object> ajaxFaqList(FaqVO faqVO, 
    		@RequestParam(value="movePage") int movePage,
    		@RequestParam(value="keyWorld") String keyWorld,
    		@RequestParam(value="searchType") String searchType,
    		@RequestParam(value="categorys") String category) throws Exception {
		
		faqVO.setCategoryCode(category);
		faqVO.setKeyWorld(keyWorld);
		faqVO.setSearchType(searchType);
		
		int listCnt = service.selectFaqListCnt(faqVO);
		
		Pagination pagination = new Pagination(listCnt, movePage);
		faqVO.setStartIndex(pagination.getStartIndex());
		faqVO.setCntPerPage(pagination.getPageSize());

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("faqList", service.faqList(faqVO));
		map.put("listCnt", listCnt);
		map.put("pagination", pagination);
		map.put("categorys",categoryAdminDAO.categoryList());
		return map;
    }

	@ResponseBody
	@RequestMapping(value="/ajaxfaqdel.do", method = RequestMethod.POST)
    public Map<String, Object> ajaxFaqDel(@RequestBody int idx) throws Exception {
		service.faqDelete(idx);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isSuccess", "true");
		return map;
    }
}
