package org.ecobay.admin.member;

import java.util.HashMap;
import java.util.Map;

import org.ecobay.admin.board.domain.NoticeVO;
import org.ecobay.admin.member.domain.BlacklistVO;
import org.ecobay.admin.member.service.MemberAdminService;
import org.ecobay.user.member.domain.MemberVO;
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
public class MemberAdminController {
	
	@Autowired
	MemberAdminService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberAdminController.class);
	
	@RequestMapping(value="/memberlist.do", method = RequestMethod.GET)
    public String memberList(MemberVO memberVO, @RequestParam(defaultValue="1") int curPage,Model model) throws Exception {
		
		int listCnt = service.memberListCount(memberVO);
		
		Pagination pagination = new Pagination(listCnt, curPage);
		
		memberVO.setStartIndex(pagination.getStartIndex());
		memberVO.setCntPerPage(pagination.getPageSize());
    	
    	model.addAttribute("list", service.memberList(memberVO));
    	model.addAttribute("cnt", listCnt);
    	model.addAttribute("pagination", pagination);
    	
    	return "admin/memberList.admin";
    }
	
	@ResponseBody
	@RequestMapping(value="/ajaxmemberlist.do", method = RequestMethod.POST)
    public Map<String, Object> ajaxMemberList(@RequestBody MemberVO memberVO) throws Exception {
		
		int listCnt = service.memberListCount(memberVO);
		Pagination pagination = new Pagination(listCnt, memberVO.getMovePage());
		
		memberVO.setKeyWord(memberVO.getKeyWord());
		memberVO.setSearchType(memberVO.getSearchType());
		memberVO.setStartIndex(pagination.getStartIndex());
		memberVO.setCntPerPage(pagination.getPageSize());
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", service.memberList(memberVO));
		map.put("cnt", listCnt);
		map.put("pagination", pagination);
		
		return map;
    }
	
	@RequestMapping(value="/blacklist.do", method = RequestMethod.GET)
    public String blackList(BlacklistVO blacklistVO, @RequestParam(defaultValue="1") int curPage, Model model) throws Exception {
		int listCnt = service.blackListCount(blacklistVO);
		
		Pagination pagination = new Pagination(listCnt, curPage);
		
		blacklistVO.setStartIndex(pagination.getStartIndex());
		blacklistVO.setCntPerPage(pagination.getPageSize());
		
    	model.addAttribute("list", service.blackList(blacklistVO));
    	model.addAttribute("cnt", listCnt);
    	model.addAttribute("pagination", pagination);
    	return "admin/blackList.admin";
    }
	
	@ResponseBody
	@RequestMapping(value="/ajaxblacklist.do", method = RequestMethod.POST)
    public Map<String, Object> ajaxBlackList(@RequestBody BlacklistVO blacklistVO) throws Exception {
		
		int listCnt = service.blackListCount(blacklistVO);
		Pagination pagination = new Pagination(listCnt, blacklistVO.getMovePage());
		
		blacklistVO.setKeyWord(blacklistVO.getKeyWord());
		blacklistVO.setSearchType(blacklistVO.getSearchType());
		blacklistVO.setStartIndex(pagination.getStartIndex());
		blacklistVO.setCntPerPage(pagination.getPageSize());
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", service.blackList(blacklistVO));
		map.put("cnt", listCnt);
		map.put("pagination", pagination);
		
		return map;
    }
	
	@ResponseBody
	@RequestMapping(value="/memberblackreg.do", method = RequestMethod.POST)
	public ResponseEntity<String> memberBlackReg(@RequestBody BlacklistVO blacklistVO) throws Exception{
		ResponseEntity<String> entity = null;
		try {
			service.blackReg(blacklistVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/memberrejoin.do", method = RequestMethod.POST)
	public ResponseEntity<String> memberRejoin(@RequestBody String member_id) throws Exception{
		ResponseEntity<String> entity = null;
		try {
			service.rejoin(member_id);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/memberblackcan.do", method = RequestMethod.POST)
	public ResponseEntity<String> memberBlackCan(@RequestBody BlacklistVO blacklistVO) throws Exception{
		ResponseEntity<String> entity = null;
		try {
			service.blackCan(blacklistVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/ajaxblackcontent.do", method = RequestMethod.POST)
    public Map<String, Object> ajaxBlackContent(@RequestBody String member_id) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", service.blackContent(member_id));
		
		return map;
    }
}
