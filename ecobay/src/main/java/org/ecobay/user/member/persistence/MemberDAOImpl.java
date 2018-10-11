package org.ecobay.user.member.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ecobay.user.member.domain.MemberProductVO;
import org.ecobay.user.member.domain.MemberVO;
import org.ecobay.user.product.domain.AuctionInfoVO;
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
	public void auctionInfo(AuctionInfoVO avo) throws Exception {
		session.update(namespace + ".auctionInfo", avo); 
		
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
	
}
