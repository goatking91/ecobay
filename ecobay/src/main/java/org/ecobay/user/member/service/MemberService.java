package org.ecobay.user.member.service;

import org.ecobay.user.member.domain.MemberVO;

	public interface MemberService {
	
	public int idcheck(String member_id) throws Exception;	
		
	public void regist(MemberVO vo) throws Exception;
	
	public MemberVO read(String member_id) throws Exception;
	
	public void modify(MemberVO vo) throws Exception;
	
	public void delete(String member_id) throws Exception;
	
	public void verify(MemberVO vo) throws Exception;
	
	public Boolean pwdcheck(String member_id, String pwd) throws Exception;
}
