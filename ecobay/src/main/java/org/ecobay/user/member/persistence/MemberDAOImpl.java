package org.ecobay.user.member.persistence;

import javax.annotation.Resource;
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
}
