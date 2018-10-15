package org.ecobay.admin.product;

import java.util.HashMap;
import java.util.Map;

import org.ecobay.admin.member.domain.BlacklistVO;
import org.ecobay.admin.product.service.ProductAdminService;
import org.ecobay.user.product.domain.ProductVO;
import org.ecobay.user.util.Pagination;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
		
		String searchVal = productVO.getKeyWord();
		String searchType = productVO.getSearchType();
		
		productVO.setKeyWord(searchVal);
		productVO.setSearchType(searchType);

		Pagination pagination = new Pagination(listCnt, productVO.getMovePage());

		productVO.setStartIndex(pagination.getStartIndex());
		productVO.setCntPerPage(pagination.getPageSize());
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchType", searchType);
		map.put("searchVal", searchVal);
		map.put("list", service.productList(productVO));
		map.put("cnt", listCnt);
		map.put("pagination", pagination);
		
		return map;
    }
	
	@RequestMapping(value="/reqproductlist.do", method = RequestMethod.GET)
    public String reqproductListGET(ProductVO productVO, @RequestParam(defaultValue="1") int curPage, Model model) throws Exception {
		int pcnt = service.reqProductCount(productVO);
		
    	Pagination pagination = new Pagination(pcnt, curPage);
    	
    	productVO.setStartIndex(pagination.getStartIndex());
    	productVO.setCntPerPage(pagination.getPageSize());

    	model.addAttribute("list", service.reqProductList(productVO));
		model.addAttribute("pcnt", pcnt);
    	model.addAttribute("pagination", pagination);

    	return "admin/reqProductList.admin";
    }

	@ResponseBody
	@RequestMapping(value="/ajaxreqproductlist.do", method = RequestMethod.POST)
    public Map<String, Object> ajaxreqProductList(@RequestBody ProductVO productVO) throws Exception {
		int listCnt = service.reqProductCount(productVO);
		Pagination pagination = new Pagination(listCnt, productVO.getMovePage());
		
		productVO.setKeyWord(productVO.getKeyWord());
		productVO.setSearchType(productVO.getSearchType());
		productVO.setStartIndex(pagination.getStartIndex());
		productVO.setCntPerPage(pagination.getPageSize());
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", service.reqProductList(productVO));
		map.put("cnt", listCnt);
		map.put("pagination", pagination);
		
		return map;
    }
	
	@ResponseBody
	@RequestMapping(value="/productreqproc.do", method = RequestMethod.POST)
	public ResponseEntity<String> productReqProc(@RequestBody ProductVO productVO) throws Exception{
		ResponseEntity<String> entity = null;
		
		try {
			String statecd = productVO.getState_cd();
			
			if(statecd.equals("3") || statecd.equals("4")) {
				if(statecd.equals("3")) {
					productVO.setState_nm("승인");
				}
				else {
					productVO.setState_nm("반려");
				}
				
				service.updateProductState(productVO);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
			else {
				entity = new ResponseEntity<String>("승인/반려만 처리가능합니다.", HttpStatus.BAD_REQUEST);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
    @RequestMapping(value = "/ajaxreqproductdetail.do")
    public Map<String, Object> detail(@RequestParam("product_cd") String product_cd) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
    	ProductVO productVO = service.selectDetailProd(product_cd);
    	
    	if(productVO != null) {
    		map.put("prod", productVO);	
    		map.put("img", service.selectImageList(product_cd));
    		map.put("auct", service.selectDetailAuct(product_cd));
    		map.put("deli", service.selectDetailDeli(product_cd));
    	}
    	
    	return map;
    }
}
