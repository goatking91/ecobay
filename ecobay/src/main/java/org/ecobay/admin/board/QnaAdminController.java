package org.ecobay.admin.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ecobay.admin.board.domain.QnaReplyVO;
import org.ecobay.admin.board.domain.QnaVO;
import org.ecobay.admin.board.service.BoardAdminService;
import org.ecobay.user.util.Pagination;
import org.ecobay.user.util.UploadContoller;
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
@RequestMapping("/admin/board")
public class QnaAdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadContoller.class);
	
	@Autowired
	BoardAdminService service;
	
	@RequestMapping(value="/qnalist.do", method = RequestMethod.GET)
    public String qnaList(QnaVO qnaVO, @RequestParam(defaultValue="1") int curPage, Model model) throws Exception {
		
		
		int listCnt = service.selectQnaListCnt(qnaVO);
		
		Pagination pagination = new Pagination(listCnt, curPage);
		
		qnaVO.setStartIndex(pagination.getStartIndex());
		qnaVO.setCntPerPage(pagination.getPageSize());
		
		model.addAttribute("qnaList", service.qnaList(qnaVO));
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pagination", pagination);
		
		return "admin/board/qnaList.admin";
    }
	
	
	@ResponseBody
	@RequestMapping(value="/ajaxqnalist.do", method = RequestMethod.GET)
    public Map<String, Object> ajaxQnaList(QnaVO qnaVO, @RequestParam(value="movePage") int movePage) throws Exception {
		
		int listCnt = service.selectQnaListCnt(qnaVO);
		Pagination pagination = new Pagination(listCnt, movePage);
		
		qnaVO.setStartIndex(pagination.getStartIndex());
		qnaVO.setCntPerPage(pagination.getPageSize());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qnaList", service.qnaList(qnaVO));
		map.put("listCnt", listCnt);
		map.put("pagination", pagination);
		
		return map;
    }
	
	@RequestMapping(value="/qnadetail.do", method = RequestMethod.POST)
    public String qnaDetail(@RequestParam("idx") String notice_idx, Model model) throws Exception {
		int idx = Integer.parseInt(notice_idx);
		model.addAttribute("qna",service.qnaLoad(idx));
		return "admin/board/qnaDetail.admin";
    }
	
	@ResponseBody
	@RequestMapping(value="/ajaxqnadel.do", method = RequestMethod.POST)
    public Map<String, Object> ajaxQnaDel(@RequestBody int qna_idx) throws Exception {
		service.qnaDelete(qna_idx);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isSuccess", "true");
		return map;
    }
	
	
	
	//QNA 답글 처리 영역
	@ResponseBody
	@RequestMapping(value="/reqnareg.do", method = RequestMethod.POST)
    public Map<String, Object> reQnaRegPOST(QnaReplyVO vo, 
    										@RequestParam(value = "idx") int idx, 
    										@RequestParam(value = "content") String content) throws Exception {
		vo.setContent(content);
		vo.setQna_idx(idx);
		service.qnaReplyRegist(vo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isSuccess", "true");
		return map;
    }
	
	@ResponseBody
	@RequestMapping(value="/reqnalist.do", method=RequestMethod.POST)
	public Map<String, Object> ajaxReQnaList(@RequestBody String qna_idx)throws Exception{
		int idx = Integer.parseInt(qna_idx);
		QnaVO qnaVO = service.qnaLoad(idx);
		
		List<QnaReplyVO> qnaReplyList = qnaVO.getQnaReplyList();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qnaReplyList", qnaReplyList);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/reqnadel.do", method = RequestMethod.POST)
    public Map<String, Object> reQnaDelPOST(@RequestBody int qnarp_idx) throws Exception {
		service.qnaReplyDelete(qnarp_idx);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isSuccess", "true");
		return map;
    }
}
