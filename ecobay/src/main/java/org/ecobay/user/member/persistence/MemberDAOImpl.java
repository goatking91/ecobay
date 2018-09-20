package org.ecobay.user.member.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ecobay.user.member.domain.MemberVO;
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
	public List<MemberVO> listAll() throws Exception {
		return session.selectList(namespace + ".readAll");
	}

	@Override
	public int count() throws Exception {
		return session.selectOne(namespace + ".count");
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
	
}
