package org.ecobay.user.main;

import org.ecobay.user.product.domain.ProductVO;
import org.ecobay.user.product.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value="/", method = RequestMethod.GET)
    public String rootMain() throws Exception {

        return "redirect:/main.do";
    }
	
	@RequestMapping(value="/main.do", method = RequestMethod.GET)
    public String main(Model model, ProductVO vo) throws Exception {
		vo.setStart_num(1);
		vo.setEnd_num(4);
		model.addAttribute("list1", productService.selectListBest(vo));
		vo.setStart_num(5);
		vo.setEnd_num(8);
		model.addAttribute("list2", productService.selectListBest(vo));
        return "main.page";
    }
	
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
    public String login() {
    	return "login.part";
    }
	
	//소개페이지
	@RequestMapping(value="/intro.do", method = RequestMethod.GET)
    public String intro() {
    	return "introduction.page";
    }
	
	
}
