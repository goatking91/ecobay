package org.ecobay.user.product;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.ecobay.user.product.domain.ProductVO;
import org.ecobay.user.product.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/product")
@Controller
public class ProductController {
	
	@Autowired
	ProductService service;
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@RequestMapping(value = "/register.do", method = RequestMethod.GET)
    public String registerGET(Model model) throws Exception {
		model.addAttribute("bigclass", service.bigclassList());
		
    	return "product/register.page";
    }
	
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
    public String registerPOST(ProductVO vo) throws Exception {
		// 상풍코드 생성 - [상품코드[상품코드(14자리) : 대분류코드(2자리) + 중분코드(2자리) + 날짜(yyMMdd(6자리)) + 일련번호(4자리) ]
		SimpleDateFormat transFormat = new SimpleDateFormat("yyMMdd");
		String sDate = transFormat.format(new Date());
		
		String searchVal = vo.getClass_big_cd() + vo.getClass_mid_cd() + sDate;
		
		int iMaxCnt = service.maxCnt(searchVal);
		
		String sproductcode = searchVal + String.format("%04d", iMaxCnt);
		vo.setProduct_cd(sproductcode);
		
		service.insert(vo);
		
    	return "redirect:/product/list.do";
    }
    
    @RequestMapping(value = "/detail.do")
    public String detail(@RequestParam("product_cd") String product_cd, Model model) throws Exception {
    	model.addAttribute("product", service.select(product_cd));
    	
    	return "product/detail.page";
    }
    
/*    @RequestMapping(value = "/edit.do", method = RequestMethod.GET)
    public String editGET(@RequestParam("product_cd") String product_cd, Model model) throws Exception {
    	model.addAttribute("product", service.select(product_cd));
    	
    	return "product/edit.page";
    }
    
    @RequestMapping(value = "/edit.do", method = RequestMethod.POST)
    public String editPOST(ProductVO vo) throws Exception {
    	service.update(vo);
    	
    	return "redirect:/product/detail.do";
    }*/
    
    @RequestMapping("/list.do")
    public String list(Model model) throws Exception {
    	model.addAttribute("productList", service.selectList());
    	
    	return "product/list.page";
    }
    
    @RequestMapping(value = "/midclass.do", method = RequestMethod.POST)
    public String classList(@RequestParam("class_big_cd") String class_big_cd, Model model) throws Exception {
    	model.addAttribute("midclass", service.midclassList(class_big_cd));
    	return "product/register.page";
    }
}
