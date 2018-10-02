package org.ecobay.user.member.service;

import org.ecobay.user.member.domain.MemberVO;
import org.ecobay.user.product.domain.AuctionInfoVO;
import org.ecobay.user.product.domain.BidInfoVO;
import org.ecobay.user.product.domain.DeliveryVO;
import org.ecobay.user.product.domain.PaymentVO;

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
	
	public BidInfoVO selectBid(String member_id) throws Exception;
	
	public String selectprod(String product_cd) throws Exception;
	
	public String selectimg(String product_cd) throws Exception;
	
	public void payment(PaymentVO pvo) throws Exception;
	
	public void delivery(DeliveryVO dvo) throws Exception;
	
	public void auctionInfo(String product_cd) throws Exception;
	
}
