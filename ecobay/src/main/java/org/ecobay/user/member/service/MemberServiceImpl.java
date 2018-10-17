package org.ecobay.user.member.service;

import java.util.List;

import org.ecobay.user.member.domain.MemberProductVO;
import org.ecobay.user.member.domain.MemberQnaVO;
import org.ecobay.user.member.domain.MemberVO;
import org.ecobay.user.member.persistence.MemberDAO;
import org.ecobay.user.product.domain.AuctionInfoVO;
import org.ecobay.user.product.domain.DeliveryVO;
import org.ecobay.user.product.domain.PaymentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public void regist(MemberVO vo) throws Exception {
		//비밀번호 암호화
		String encPassword = passwordEncoder.encode(vo.getPwd());
		vo.setPwd(encPassword);
		dao.create(vo);
	}

	@Override
	public MemberVO read(String member_id) throws Exception {
		return dao.read(member_id);
	}

	@Override
	public void modify(MemberVO vo) throws Exception {
/*		String encPassword = passwordEncoder.encode(vo.getPwd());
		vo.setPwd(encPassword);*/
		dao.update(vo);	
	}

	@Override
	public void delete(String member_id) throws Exception {//회원탈퇴
		dao.delete(member_id);
	}

	@Override
	public void verify(MemberVO vo) throws Exception {
		dao.verify(vo);	
	}

	@Override
	public int idcheck(String member_id) throws Exception {
		return dao.idcheck(member_id);
	}

	@Override
	public Boolean pwdcheck(String member_id, String pwd) throws Exception {
		String encPassword = dao.pwdcheck(member_id);
		return passwordEncoder.matches(pwd, encPassword);
	}

	@Override
	public String idfind(MemberVO vo) throws Exception {
		return dao.idfind(vo);
	}

	@Override
	public String pwdfind(MemberVO vo) throws Exception {
		return dao.pwdfind(vo);
	}

	@Override
	public void newpwd(MemberVO vo) throws Exception {
			String encPassword = passwordEncoder.encode(vo.getPwd());
			vo.setPwd(encPassword);
			dao.newpwd(vo);
	}

	@Override
	public String selectprod(String product_cd) throws Exception {
		return dao.selectprod(product_cd);
	}

	@Override
	public String selectimg(String product_cd) throws Exception {
		return dao.selectimg(product_cd);
	}

	@Override
	public AuctionInfoVO selectAuct(String product_cd) throws Exception {
		return dao.selectAuct(product_cd);
	}

	@Override
	public List<MemberProductVO> wishList(MemberProductVO vo) throws Exception {
		return dao.wishList(vo);
	}

	@Override
	public int wishTotal(String member_id) throws Exception {
		return dao.wishTotal(member_id);
	}

	@Override
	public void chkDel(List<String> list) throws Exception {
		dao.chkDel(list);
		
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public String paymentPrs(PaymentVO pvo, DeliveryVO dvo, AuctionInfoVO auctVO) {
		String retVal = "ERR";
		
		dao.payment(pvo);
		dao.delivery(dvo);
		dao.auctionInfo(auctVO);
		
		retVal = "OK";
		
		return retVal;
	}

	@Override
	public List<MemberProductVO> sellList(MemberProductVO vo) throws Exception {
		return dao.sellList(vo);
	}

	@Override
	public int sellCnt(String member_id) throws Exception {
		return dao.sellCnt(member_id);
	}

	@Override
	public List<MemberProductVO> buyList(MemberProductVO vo) throws Exception {
		return dao.buyList(vo);
	}

	@Override
	public int buyCnt(String member_id) throws Exception {
		return dao.buyCnt(member_id);
	}

	@Override
	public void stateChange(String product_cd) throws Exception {
		dao.stateChange(product_cd);
	}

	@Override
	public List<MemberQnaVO> qnaList(MemberQnaVO vo) throws Exception {
		return dao.qnaList(vo);
	}

	@Override
	public int qnaCnt(String member_id) throws Exception {
		return dao.qnaCnt(member_id);
	}
	
}
