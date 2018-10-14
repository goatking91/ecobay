package org.ecobay.admin.member.service;

import java.util.List;

import org.ecobay.user.member.domain.MemberVO;
import org.ecobay.admin.member.domain.BlacklistVO;
import org.ecobay.admin.member.persistence.MemberAdminDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberAdminServiceImpl implements MemberAdminService {
	@Autowired
	private MemberAdminDAO dao;


	@Override
	public List<MemberVO> memberList(MemberVO memberVO) throws Exception {
		return dao.memberList(memberVO);
	}

	@Override
	public int memberListCount(MemberVO memberVO) throws Exception {
		return dao.memberListCount(memberVO);
	}
	
	@Override
	public List<MemberVO> blackList(BlacklistVO blacklistVO) throws Exception {
		return dao.blackList(blacklistVO);
	}

	@Override
	public int blackListCount(BlacklistVO blacklistVO) throws Exception {
		return dao.blackListCount(blacklistVO);
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public void blackReg(BlacklistVO blacklistVO) throws Exception {
		dao.blackRegId(blacklistVO.getMember_id());
		dao.blackRegContent(blacklistVO);
	}
	
	@Override
	public void rejoin(String member_id) throws Exception {
		dao.rejoin(member_id);
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public void blackCan(BlacklistVO blacklistVO) throws Exception {
		dao.blackCanId(blacklistVO.getMember_id());
		dao.blackCanContent(blacklistVO);
	}

	@Override
	public List<BlacklistVO> blackContent(String member_id) throws Exception {
		return dao.blackContent(member_id);
	}

	
}
