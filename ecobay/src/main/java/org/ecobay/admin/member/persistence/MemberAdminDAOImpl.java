package org.ecobay.admin.member.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ecobay.admin.member.domain.BlacklistVO;
import org.ecobay.user.member.domain.MemberVO;
import org.springframework.stereotype.Repository;

@Repository
public class MemberAdminDAOImpl implements MemberAdminDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.ecobay.admin.mapper.MemberMapper";

	@Override
	public List<MemberVO> memberList(MemberVO memberVO) throws Exception {
		return session.selectList(namespace + ".memberList", memberVO);
	}

	@Override
	public int memberListCount(MemberVO memberVO) throws Exception {
		return session.selectOne(namespace + ".memberListCount", memberVO);
	}
	
	@Override
	public List<MemberVO> blackList(BlacklistVO blacklistVO) throws Exception {
		return session.selectList(namespace + ".blackList", blacklistVO);
	}

	@Override
	public int blackListCount(BlacklistVO blacklistVO) throws Exception {
		return session.selectOne(namespace + ".blackListCount", blacklistVO);
	}

	@Override
	public void blackRegId(String member_id) throws Exception {
		session.update(namespace + ".blackRegId", member_id);
	}
	
	@Override
	public void blackRegContent(BlacklistVO blacklistVO) throws Exception {
		session.insert(namespace + ".blackRegContent", blacklistVO);
	}
	
	@Override
	public void rejoin(String member_id) throws Exception {
		session.update(namespace + ".rejoin", member_id);
	}
	
	@Override
	public void blackCanId(String member_id) throws Exception {
		session.update(namespace + ".blackCanId", member_id);
	}

	@Override
	public void blackCanContent(BlacklistVO blacklistVO) throws Exception {
		session.update(namespace + ".blackCanContent", blacklistVO);
	}

	@Override
	public List<BlacklistVO> blackContent(String member_id) throws Exception {
		return session.selectList(namespace + ".blackContent", member_id);
	}

	
}
