package org.ecobay.admin.board;

import org.ecobay.admin.board.service.BoardAdminService;
import org.ecobay.user.util.UploadContoller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/board")
public class QnaAdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadContoller.class);
	
	@Autowired
	BoardAdminService service;
	
	@RequestMapping(value="/qnalist.do", method = RequestMethod.GET)
    public String qnaList(Model model) throws Exception {
		model.addAttribute("qnaList", service.qnaList());
		return "admin/board/qnaList.admin";
    }
	
	
	@RequestMapping(value="/qnadetail.do", method = RequestMethod.GET)
    public String qnaDetail(@RequestParam("idx") String notice_idx, Model model) throws Exception {
		int idx = Integer.parseInt(notice_idx);
		model.addAttribute("qna",service.qnaLoad(idx));
		return "admin/board/qnaDetail.admin";
    }
	
}
