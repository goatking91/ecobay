package org.ecobay.admin.product;

import java.util.HashMap;
import java.util.Map;

import org.ecobay.admin.product.service.ProductAdminService;
import org.ecobay.user.product.domain.ProductVO;
import org.ecobay.user.util.Pagination;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin")
public class ProductAdminController {
	
	@Autowired
	ProductAdminService service;
	
	private static final Logger logger = LoggerFactory.getLogger(ProductAdminController.class);
	
	@RequestMapping(value="/productlist.do", method = RequestMethod.GET)
    public String productListGET(ProductVO productVO, @RequestParam(defaultValue="1") int curPage, Model model) throws Exception {
		int pcnt = service.productCount(productVO);
		
    	Pagination pagination = new Pagination(pcnt, curPage);
    	
    	productVO.setStartIndex(pagination.getStartIndex());
    	productVO.setCntPerPage(pagination.getPageSize());

    	model.addAttribute("list", service.productList(productVO));
		model.addAttribute("pcnt", pcnt);
    	model.addAttribute("pagination", pagination);

    	return "admin/productList.admin";
    }

	@ResponseBody
	@RequestMapping(value="/ajaxproductlist.do", method = RequestMethod.POST)
    public Map<String, Object> ajaxProductList(@RequestBody ProductVO productVO) throws Exception {
		int listCnt = service.productCount(productVO);
		Pagination pagination = new Pagination(listCnt, productVO.getMovePage());
		
		productVO.setKeyWord(productVO.getKeyWord());
		productVO.setSearchType(productVO.getSearchType());
		productVO.setStartIndex(pagination.getStartIndex());
		productVO.setCntPerPage(pagination.getPageSize());
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", service.productList(productVO));
		map.put("cnt", listCnt);
		map.put("pagination", pagination);
		
		return map;
    }
}
