package org.ecobay.user.product;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/product")
@Controller
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@RequestMapping("/register.do")
    public String register() {
    	return "product/register.page";
    }
    
    @RequestMapping("/detail.do")
    public String detail() {
    	return "product/.page";
    }
    
    @RequestMapping("/list.do")
    public String list() {
    	return "product/list.page";
    }
}
