package org.ecobay.admin.member.service;

import java.util.List;

import org.ecobay.user.member.domain.MemberVO;
import org.ecobay.admin.member.persistence.AdminMemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {
	@Autowired
	private AdminMemberDAO dao;


	@Override
	public List<MemberVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public int count() throws Exception {
		return dao.count();
	}

	
	
}
