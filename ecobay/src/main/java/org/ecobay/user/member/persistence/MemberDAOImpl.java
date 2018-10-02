package org.ecobay.user.member.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ecobay.user.member.domain.MemberVO;
import org.ecobay.user.product.domain.BidInfoVO;
import org.ecobay.user.product.domain.DeliveryVO;
import org.ecobay.user.product.domain.PaymentVO;
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
	public void delete(String member_id) throws Exception {
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
	public BidInfoVO selectBid(String member_id) throws Exception {
		return session.selectOne(namespace + ".selectBid", member_id);
	}

	@Override
	public String selectprod(String product_cd) throws Exception {
		return session.selectOne(namespace + ".selectProd", product_cd);
	}

	@Override
	public String selectimg(String product_cd) throws Exception {
		return session.selectOne(namespace + ".selectImg", product_cd);
	}

	@Override
	public void payment(PaymentVO pvo) throws Exception {
		session.insert(namespace + ".payment", pvo);		
	}

	@Override
	public void delivery(DeliveryVO dvo) throws Exception {
		session.insert(namespace + ".delivery", dvo);
	}

	@Override
	public void auctionInfo(String product_cd) throws Exception {
		session.update(namespace + ".auctionInfo", product_cd); 
		
	}
	
}
