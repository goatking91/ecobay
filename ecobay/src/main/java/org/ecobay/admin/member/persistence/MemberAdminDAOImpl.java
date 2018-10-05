package org.ecobay.admin.member.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ecobay.user.member.domain.MemberVO;
import org.springframework.stereotype.Repository;

@Repository
public class MemberAdminDAOImpl implements MemberAdminDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.ecobay.admin.mapper.MemberMapper";

	@Override
	public List<MemberVO> listAll() throws Exception {
		return session.selectList(namespace + ".readAll");
	}

	@Override
	public int count() throws Exception {
		return session.selectOne(namespace + ".count");
	}

	
	
}
