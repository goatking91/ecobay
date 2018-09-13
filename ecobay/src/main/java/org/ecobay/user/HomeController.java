package org.ecobay.user;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
    
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    
    /**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {
        logger.info("Welcome ecobay! The client locale is {}.", locale);
        
        return "main.page";
    }
    
    @RequestMapping("/memberJoin.do")
    public String join() {
    	return "join.page";
    }
     
    
    @RequestMapping("productReg.do")
    public String prodReg()
    {
    	return "productRegistration.page";
    }
    
    @RequestMapping("productDetail.do")
    public String prodDetail()
    {
    	return "productDetail.page";
    }
}