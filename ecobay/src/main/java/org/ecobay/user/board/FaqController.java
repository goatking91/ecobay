package org.ecobay.user.board;

import java.util.HashMap;
import java.util.Map;

import org.ecobay.admin.board.domain.FaqVO;
import org.ecobay.admin.board.domain.QnaVO;
import org.ecobay.admin.board.persistence.CategoryAdminDAO;
import org.ecobay.user.board.service.BoardService;
import org.ecobay.user.util.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/support/faq")
public class FaqController {
	
	@Autowired
	BoardService service;

	@Autowired
	private CategoryAdminDAO categoryAdminDAO;
	
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
		
        return "/support/faqList.page";
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
	
	
    
}
