package org.ecobay.user.member.service;

import java.util.List;

import org.ecobay.user.member.domain.MemberProductVO;
import org.ecobay.user.member.domain.MemberQnaVO;
import org.ecobay.user.member.domain.MemberVO;
import org.ecobay.user.product.domain.AuctionInfoVO;
import org.ecobay.user.product.domain.DeliveryVO;
import org.ecobay.user.product.domain.PaymentVO;
import org.ecobay.user.product.domain.ProductVO;

	public interface MemberService {
	
	public int idcheck(String member_id) throws Exception;	
		
	public void regist(MemberVO vo) throws Exception;
	
	public MemberVO read(String member_id) throws Exception;
	
	public void modify(MemberVO vo) throws Exception;
	
	public void delete(String member_id) throws Exception;
	
	public void verify(MemberVO vo) throws Exception;
	
	public Boolean pwdcheck(String member_id, String pwd) throws Exception;
	
	public String idfind(MemberVO vo) throws Exception; 
	
	public String pwdfind(MemberVO vo) throws Exception; 
	
	public void newpwd(MemberVO vo) throws Exception;
	
	public AuctionInfoVO selectAuct(String product_cd) throws Exception;
	
	public ProductVO selectprod(String product_cd) throws Exception;
	
	public MemberVO selectProdMember(String product_cd) throws Exception;
	
	public String selectimg(String product_cd) throws Exception;
	
	public int deliveryInfo(String product_cd) throws Exception;
	
	public List<MemberProductVO> wishList(MemberProductVO vo) throws Exception;
	
	public int wishTotal(String member_id) throws Exception;
	
	public List<MemberProductVO> sellList(MemberProductVO vo) throws Exception;
	
	public int sellCnt(String member_id) throws Exception;
	
	public List<MemberProductVO> buyList(MemberProductVO vo) throws Exception;
	
	public int buyCnt(String member_id) throws Exception;
	
	public void chkDel(List<String> list) throws Exception;
	
	public String paymentPrs(PaymentVO pvo, DeliveryVO dvo, AuctionInfoVO auctVO, int deliveryInfo, int flag);
	
	public void stateChange(String product_cd) throws Exception;
	
	public List<MemberQnaVO> qnaList(MemberQnaVO vo) throws Exception;
	
	public int qnaCnt(String member_id) throws Exception;
	
	public void updatePayCancel(String product_cd)throws Exception;
	
	public DeliveryVO selectDeliProd(String product_cd) throws Exception;
}
