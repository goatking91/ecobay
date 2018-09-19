package org.ecobay.user.member.service;

import java.util.List;

import org.ecobay.user.member.domain.MemberVO;

	public interface MemberService {
	
	public int idcheck(String member_id) throws Exception;	
		
	public void regist(MemberVO vo) throws Exception;
	
	public MemberVO read(String member_id) throws Exception;
	
	public void modify(MemberVO vo) throws Exception;
	
	public void delete(String member_id) throws Exception;
	
	public List<MemberVO> listAll() throws Exception;
	
	public int count() throws Exception;
	
	public void verify(MemberVO vo) throws Exception;
}
