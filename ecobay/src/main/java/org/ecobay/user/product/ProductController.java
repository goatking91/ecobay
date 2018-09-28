package org.ecobay.user.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.ecobay.user.product.domain.ProductVO;
import org.ecobay.user.product.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/product")
@Controller
public class ProductController {
	
	@Autowired
	ProductService service;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	private int pageCount = 12;
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@RequestMapping(value = "/reg.do", method = RequestMethod.GET)
    public String regGET(Model model) throws Exception {
		model.addAttribute("bigclass", service.bigclassList());

    	return "product/register.page";
    }
	
	@RequestMapping(value = "/reg.do", method = RequestMethod.POST)
    public String regPOST(ProductVO vo) throws Exception {
		System.out.println(1);
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setMember_id(user.getUsername());
		service.insert(vo);
	
		return "redirect:/product/list.do";
    }
    
    @RequestMapping(value = "/detail.do")
    public String detail(@RequestParam("product_cd") String product_cd, Model model) throws Exception {
    	
    	model.addAttribute("prod", service.selectDetailProd(product_cd));
    	if(service.selectDetailProd(product_cd) != null) {
    		model.addAttribute("img", service.selectImageList(product_cd));
    		model.addAttribute("auct", service.selectDetailAuct(product_cd));
        	model.addAttribute("deli", service.selectDetailDeli(product_cd));
    	}
    	
    	return "product/detail.page";
    }
    
/*    @RequestMapping(value = "/modify.do", method = RequestMethod.GET)
    public String modifyGET(@RequestParam("product_cd") String product_cd, Model model) throws Exception {
    	model.addAttribute("product", service.select(product_cd));
    	
    	return "product/modify.page";
    }
    
    @RequestMapping(value = "/modify.do", method = RequestMethod.POST)
    public String modifyPOST(ProductVO vo) throws Exception {
    	service.update(vo);
    	
    	return "redirect:/product/detail.do";
    }*/

	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
    public String list(ProductVO vo, Model model) throws Exception {
		model.addAttribute("bigclass", service.bigclassList());
		System.out.println(vo.getSearchVal());
		vo.setStart_num(1);
		vo.setEnd_num(pageCount);
		model.addAttribute("productList", service.selectList(vo));

    	return "product/list.page";
    }
	
    @ResponseBody
    @RequestMapping(value = "/list.do/{page}", method = RequestMethod.POST)
    public Map<String, List<ProductVO>> listPOST(@PathVariable("page") int page, ProductVO vo) throws Exception {
		vo.setStart_num((page-1) * pageCount + 1 );
		vo.setEnd_num(page * pageCount);
		
		Map<String, List<ProductVO>> map = new HashMap<String, List<ProductVO>>();
    	
		map.put("arr", service.selectList(vo));
    	return map;
    }
    
    @ResponseBody
    @RequestMapping(value = "/midclass.do/{class_big_cd}", method = RequestMethod.GET)
    public ResponseEntity<List<ProductVO>> classList(@PathVariable("class_big_cd") String class_big_cd) throws Exception {
  
    	return new ResponseEntity<List<ProductVO>>(service.midclassList(class_big_cd) ,HttpStatus.OK);
    }
	
}
