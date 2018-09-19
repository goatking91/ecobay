package org.ecobay.user.member.service;

import java.util.List;

import org.ecobay.user.member.domain.MemberVO;
import org.ecobay.user.member.persistence.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO dao;

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

	@Override
	public void delete(String member_id) throws Exception {
		dao.delete(member_id);
	}

	@Override
	public List<MemberVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public int count() throws Exception {
		return dao.count();
	}

	@Override
	public void verify(MemberVO vo) throws Exception {
		dao.verify(vo);	
	}
	
}
