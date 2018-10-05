package org.ecobay.admin.member.service;

import java.util.List;

import org.ecobay.user.member.domain.MemberVO;
import org.ecobay.admin.member.persistence.MemberAdminDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberAdminServiceImpl implements MemberAdminService {
	@Autowired
	private MemberAdminDAO dao;


	@Override
	public List<MemberVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public int count() throws Exception {
		return dao.count();
	}

	
	
}
