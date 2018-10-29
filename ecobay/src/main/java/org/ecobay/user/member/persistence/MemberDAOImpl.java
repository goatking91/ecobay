package org.ecobay.user.member.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ecobay.user.member.domain.MemberProductVO;
import org.ecobay.user.member.domain.MemberQnaVO;
import org.ecobay.user.member.domain.MemberVO;
import org.ecobay.user.product.domain.AuctionInfoVO;
import org.ecobay.user.product.domain.DeliveryVO;
import org.ecobay.user.product.domain.PaymentVO;
import org.ecobay.user.product.domain.ProductVO;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.ecobay.user.mapper.MemberMapper";
	
	@Override
	public void create(MemberVO vo) throws Exception {
		session.insert(namespace + ".create", vo);	
	}

	@Override
	public MemberVO read(String member_id) throws Exception {
		return session.selectOne(namespace + ".read", member_id); 
	}

	@Override
	public void update(MemberVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(String member_id) throws Exception {//회원탈퇴
		session.update(namespace + ".delete", member_id); 
	}

	@Override
	public void verify(MemberVO vo) throws Exception {
		session.update(namespace+ ".verify",vo) ;
		
	}

	@Override
	public int idcheck(String member_id) throws Exception {
		return session.selectOne(namespace + ".idcount", member_id);
	}

	@Override
	public String pwdcheck(String member_id) throws Exception {	
		return session.selectOne(namespace + ".pwdcheck", member_id);
	}

	@Override
	public String idfind(MemberVO vo) throws Exception {
		return session.selectOne(namespace + ".idfind", vo);
	}

	@Override
	public String pwdfind(MemberVO vo) throws Exception {
		return session.selectOne(namespace + ".pwdfind", vo);
	}

	@Override
	public void newpwd(MemberVO vo) throws Exception {
		session.update(namespace + ".newpwd", vo);
	}

	@Override
	public ProductVO selectprod(String product_cd) throws Exception {
		return session.selectOne(namespace + ".selectProd", product_cd);
	}
	
	@Override
	public MemberVO selectProdMember(String product_cd) throws Exception {
		return session.selectOne(namespace + ".selectProdMember", product_cd);
	}

	@Override
	public String selectimg(String product_cd) throws Exception {
		return session.selectOne(namespace + ".selectImg", product_cd);
	}
	
	@Override
	public int deliveryInfo(String product_cd) throws Exception {
		return session.selectOne(namespace + ".deliveryInfo", product_cd);
	}

	@Override
	public void payment(PaymentVO pvo) {
		session.insert(namespace + ".payment", pvo);		
	}
	
	@Override
	public void delivery(DeliveryVO dvo) {
		session.insert(namespace + ".delivery", dvo);
	}

	@Override
	public void auctionInfo(AuctionInfoVO avo) {
		session.update(namespace + ".auctionInfo", avo); 
	}
	
	@Override
	public void productPayment(ProductVO productVO) {
		session.update(namespace + ".productPayment", productVO); 
	}

	@Override
	public AuctionInfoVO selectAuct(String product_cd) throws Exception {
		return session.selectOne(namespace + ".selectAuct", product_cd);
	}

	@Override
	public List<MemberProductVO> wishList(MemberProductVO vo) throws Exception {
		return session.selectList(namespace + ".wishList", vo);
	}

	@Override
	public int wishTotal(String member_id) throws Exception {
		return session.selectOne(namespace + ".wishTotal", member_id);
	}

	@Override
	public void chkDel(List<String> list) throws Exception {
		session.delete(namespace + ".chkDel", list); 
	}

	@Override
	public List<MemberProductVO> sellList(MemberProductVO vo) throws Exception {
		return session.selectList(namespace + ".sellList", vo);
	}

	@Override
	public int sellCnt(String member_id) throws Exception {
		return session.selectOne(namespace + ".sellCnt", member_id);
	}

	@Override
	public List<MemberProductVO> buyList(MemberProductVO vo) throws Exception {
		return session.selectList(namespace + ".buyList", vo);
	}

	@Override
	public int buyCnt(String member_id) throws Exception {
		return session.selectOne(namespace + ".buyCnt", member_id);
	}

	@Override
	public void stateChange(String product_cd) throws Exception {
		session.update(namespace + ".stateChange", product_cd);
	}

	@Override
	public List<MemberQnaVO> qnaList(MemberQnaVO vo) throws Exception {
		return session.selectList(namespace + ".qnaList", vo);
	}

	@Override
	public int qnaCnt(String member_id) throws Exception {
		return session.selectOne(namespace + ".qnaCnt", member_id);
	}

	@Override
	public void paycancelauct(String product_cd) {
		session.update(namespace + ".paycancelauct", product_cd);
	}

	@Override
	public void paycancelprod(String product_cd) {
		session.update(namespace + ".paycancelprod", product_cd);
	}

	@Override
	public DeliveryVO selectDeliProd(String product_cd) throws Exception {
		return session.selectOne(namespace + ".selectDeliProd", product_cd);
	}
}
