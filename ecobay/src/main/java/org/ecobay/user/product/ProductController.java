package org.ecobay.user.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.ecobay.user.product.domain.AuctionInfoVO;
import org.ecobay.user.product.domain.BidInfoVO;
import org.ecobay.user.product.domain.ProductQnaVO;
import org.ecobay.user.product.domain.ProductVO;
import org.ecobay.user.product.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.config.annotation.authentication.configurers.userdetails.DaoAuthenticationConfigurer;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	private final int pageCount = 12; // 상품리스트 - 페이지 행갯수
	
	private final int qnaRowCnt = 10; // qna - 한 페이지에 출력될 행갯수
	private final int qnaPageCnt = 10; // qna - 한 페이지에 출력될 페이지갯수
	
	private final int bidRowCnt = 10;
	private final int bidPageCnt = 10;
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@RequestMapping(value = "/reg.do", method = RequestMethod.GET)
    public String regGET(Model model) throws Exception {
		model.addAttribute("bigclass", service.bigclassList());

    	return "product/register.page";
    }
	
	@RequestMapping(value = "/reg.do", method = RequestMethod.POST)
    public String regPOST(ProductVO vo) throws Exception {
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setMember_id(user.getUsername());
		service.insert(vo);
	
		return "redirect:/product/list.do";
    }
    
    @RequestMapping(value = "/detail.do")
    public String detail(@RequestParam("product_cd") String product_cd, Model model) throws Exception {
    	
    	model.addAttribute("prod", service.selectDetailProd(product_cd));
    	if(service.selectDetailProd(product_cd) != null) {
    		service.updateProdViewCnt(product_cd);
    		
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
    
    @ResponseBody
    @RequestMapping(value = "/prodqna.do/{product_cd}/{page}", method = RequestMethod.POST)
    public Map<String, Object> prodqnaPOST(@PathVariable("product_cd") String product_cd, @PathVariable("page") int page, ProductQnaVO vo) throws Exception {
//    	// 로그인아이디 Controller쪽에서 구하기.
//		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		String userid = user.getUsername();

    	vo.setProduct_cd(product_cd);
		vo.setStart_num((page-1) * qnaRowCnt + 1 );
		vo.setEnd_num(page * qnaRowCnt);
    	
		Map<String, Object> map = new HashMap<String, Object>();

		List<ProductQnaVO> qnaList = service.selectProdQnaList(vo);
		
		map.put("arr", qnaList);
		
    	// 페이징 처리
    	if(qnaList.size() > 0) {
    		int iPageNum = page; // 게시판의 페이지번호
    		int iPageTotalNum = 0; // 페이지 총 갯수(최종페이지번호) => 318 / 10 => 31 + 1 => 32
    		int iStartPage = 0; // 화면에 출력될 시작 페이지번호
    		int iEndPage = 0; // 화면에 출력될 종료 페이지번호
        	int iProdQnaAllCnt = service.ProdQnaAllCnt(product_cd);
        	
    		// 총페이지번호 계산
    		if(iProdQnaAllCnt % qnaRowCnt == 0) { 
    			iPageTotalNum = iProdQnaAllCnt / qnaRowCnt; 
    		}
    		else { 
    			iPageTotalNum = (iProdQnaAllCnt / qnaRowCnt) + 1; //나머지가 있는 경우 페이지수 +1 해줘야 함. 
			} 

    		iStartPage = iPageNum - ((iPageNum-1) % qnaRowCnt); // 시작페이지번호 = 선택페이지번호 - ((선택페이지번호-1) % 페이지번호 크기); 
    		iEndPage = iStartPage + (qnaRowCnt-1);
    		
    		if(iEndPage > iPageTotalNum) { 
    			iEndPage = iPageTotalNum; // 종료페이지번호가 총페이지번호(최종페이지번호)보다 클 경우 최종페이지번호로 변경. 
    		}
        	
    		map.put("iProdQnaAllCnt", iProdQnaAllCnt);
    		map.put("iPageTotalNum", iPageTotalNum);
    		map.put("iStartPage", iStartPage);
    		map.put("iEndPage", iEndPage);
    		map.put("qnaPageCnt", qnaPageCnt);
    	}

    	return map;
    }
    
    @ResponseBody
	@RequestMapping(value = "/qnaReg.do", method = RequestMethod.POST)
    public ResponseEntity<String> qnaRegPOST(ProductQnaVO vo) throws Exception {
    	ResponseEntity<String> entity = null;
    	try {
    		service.prodQnaInsert(vo);
    		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    	} catch (Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>(ex.getMessage(), HttpStatus.BAD_REQUEST);
		}
    	
    	return entity;
    }
    
    @ResponseBody
	@RequestMapping(value = "/qnaReply.do", method = RequestMethod.POST)
    public ResponseEntity<String> qnaReplyPOST(ProductQnaVO vo) throws Exception {
    	ResponseEntity<String> entity = null;
    	try {
    		service.prodQnaReplyInsert(vo);
    		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    	} catch (Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>(ex.getMessage(), HttpStatus.BAD_REQUEST);
		}
    	
    	return entity;
    }
    
    @ResponseBody
	@RequestMapping(value = "/qnaDel.do/{qna_idx}", method = RequestMethod.POST)
    public ResponseEntity<String> qnaDelPOST(@PathVariable("qna_idx") int qna_idx) throws Exception {
    	ResponseEntity<String> entity = null;
    	try {
    		service.prodQnaDelete(qna_idx);
    		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    	} catch (Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>(ex.getMessage(), HttpStatus.BAD_REQUEST);
		}
    	
    	return entity;
    }
    
    @ResponseBody
    @RequestMapping(value = "/bidList.do/{product_cd}/{page}", method = RequestMethod.POST)
    public Map<String, Object> bidListPOST(@PathVariable("product_cd") String product_cd, @PathVariable("page") int page) throws Exception {
    	BidInfoVO vo = new BidInfoVO();
    	vo.setProduct_cd(product_cd);
		vo.setStart_num((page-1) * bidRowCnt + 1);
		vo.setEnd_num(page * bidRowCnt);
		
		List<BidInfoVO> bidList = service.selectBidList(vo);

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("arr", bidList);
		
		int bidRowCnt = 0;
		
    	// 페이징 처리
    	if(bidList != null && bidList.size() > 0) {
    		int iPageNum = page; // 게시판의 페이지번호
    		int iPageTotalNum = 0; // 페이지 총 갯수(최종페이지번호) => 318 / 10 => 31 + 1 => 32
    		int iStartPage = 0; // 화면에 출력될 시작 페이지번호
    		int iEndPage = 0; // 화면에 출력될 종료 페이지번호
        	int iBidAllCnt = service.BidAllCnt(product_cd);
        	
        	bidRowCnt = bidList.size();
        	
    		// 총페이지번호 계산
    		if(iBidAllCnt % bidRowCnt == 0) { 
    			iPageTotalNum = iBidAllCnt / bidRowCnt; 
    		}
    		else { 
    			iPageTotalNum = (iBidAllCnt / bidRowCnt) + 1; //나머지가 있는 경우 페이지수 +1 해줘야 함. 
			} 

    		iStartPage = iPageNum - ((iPageNum-1) % bidRowCnt); // 시작페이지번호 = 선택페이지번호 - ((선택페이지번호-1) % 페이지번호 크기); 
    		iEndPage = iStartPage + (bidRowCnt-1);
    		
    		if(iEndPage > iPageTotalNum) { 
    			iEndPage = iPageTotalNum; // 종료페이지번호가 총페이지번호(최종페이지번호)보다 클 경우 최종페이지번호로 변경. 
    		}
        	
    		map.put("iBidAllCnt", iBidAllCnt);
    		map.put("iPageTotalNum", iPageTotalNum);
    		map.put("iStartPage", iStartPage);
    		map.put("iEndPage", iEndPage);
    		map.put("bidPageCnt", bidPageCnt);
    		map.put("bidRowCnt", bidRowCnt);
    	}

    	return map;
    }
    
    @ResponseBody
    @RequestMapping(value = "/bidReg.do", method = RequestMethod.POST)
    public Map<String, Object> bidRegPOST(@RequestBody AuctionInfoVO auctVo) throws Exception {
    	String product_cd = auctVo.getProduct_cd();
    	long money_first = auctVo.getMoney_first();
    	long money_unit = auctVo.getMoney_unit();
    	String member_id = auctVo.getBay_member_id();
    	
    	BidInfoVO bidVo = service.selectMaxMoneyBid(product_cd);
    	
    	long iMax_money_bid_bf = bidVo.getMoney_bid_max();
    	int iMember_Cnt = bidVo.getMember_cnt();
    	long iMax_money_bid_af = 0;
    	
    	if(iMax_money_bid_bf == 0) {
    		iMax_money_bid_af = money_first + money_unit;
    	}
    	else {
    		iMax_money_bid_af = iMax_money_bid_bf + money_unit;
    	}
    	
    	iMember_Cnt = iMember_Cnt + 1;

    	BidInfoVO vo = new BidInfoVO();
    	vo.setProduct_cd(product_cd);
    	vo.setMember_id(member_id);
    	vo.setMoney_bid(iMax_money_bid_af);
		
		service.bidInsert(vo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("Max_money_bid", iMax_money_bid_af);
		map.put("Member_Cnt", iMember_Cnt);
		
		return map;
    }
    
    @ResponseBody
    @RequestMapping(value = "/prodWish.do/{product_cd}", method = RequestMethod.POST)
    public void prodWishPOST(@PathVariable("product_cd") String product_cd) throws Exception {
//    	// 로그인아이디 Controller쪽에서 구하기.
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userid = user.getUsername();
    	
    	ProductVO vo = new ProductVO();
    	vo.setProduct_cd(product_cd);
    	vo.setMember_id(userid);
		
		service.prodWishInsert(vo);
    }
}
