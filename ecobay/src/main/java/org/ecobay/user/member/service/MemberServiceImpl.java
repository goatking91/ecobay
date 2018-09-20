package org.ecobay.user.member.service;

import java.util.List;

import org.ecobay.user.member.domain.MemberVO;
import org.ecobay.user.member.persistence.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public void regist(MemberVO vo) throws Exception {
		//비밀번호 암호화
		String encPassword = passwordEncoder.encode(vo.getPwd());
		vo.setPwd(encPassword);
		System.out.println("암호화된 비밀번호: "+vo.getPwd());
		dao.create(vo);
	}

	@Override
	public MemberVO read(String member_id) throws Exception {
		return dao.read(member_id);
	}

	@Override
	public void modify(MemberVO vo) throws Exception {
		String encPassword = passwordEncoder.encode(vo.getPwd());
		vo.setPwd(encPassword);
		System.out.println("암호화된 비밀번호: "+vo.getPwd());
		dao.update(vo);	
	}

	@Override
	public void delete(String member_id) throws Exception {
		dao.delete(member_id);
	}

	@Override
	public void verify(MemberVO vo) throws Exception {
		dao.verify(vo);	
	}

	@Override
	public int idcheck(String member_id) throws Exception {
		return dao.idcheck(member_id);
	}

	@Override
	public Boolean pwdcheck(String member_id, String pwd) throws Exception {
		String encPassword = dao.pwdcheck(member_id);
		return passwordEncoder.matches(pwd, encPassword);
	}
	
}
