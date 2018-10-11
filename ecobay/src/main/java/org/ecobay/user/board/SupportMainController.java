package org.ecobay.user.board;

import java.util.HashMap;
import java.util.Map;

import org.ecobay.user.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SupportMainController {
	
	@Autowired
	BoardService service;
	
	@RequestMapping(value="/support.do", method = RequestMethod.GET)
    public String supportMain(Model model) throws Exception {
        return "support/supportMain.page";
    }
    
	@ResponseBody
	@RequestMapping(value="/ajaxnoticelist.do", method=RequestMethod.POST)
	public Map<String, Object> ajaxNoticeList() throws Exception{
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeTopList", service.LoadNoticeTopList());
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxfaqlist.do", method=RequestMethod.POST)
	public Map<String, Object> ajaxFaqList() throws Exception{
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("faqTopList", service.LoadFaqTopList());
		
		return map;
	}
}
