package org.ecobay.user.member.service;

import javax.inject.Inject;

import org.ecobay.user.member.domain.MemberVO;
import org.ecobay.user.member.persistence.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO dao;

	@Transactional
	@Override
	public void regist(MemberVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public MemberVO read(String member_id) throws Exception {
		return dao.read(member_id);
	}

	@Override
	public void modify(MemberVO vo) throws Exception {
		dao.update(vo);	
	}
}
