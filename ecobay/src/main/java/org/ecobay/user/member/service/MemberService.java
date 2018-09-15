package org.ecobay.user.member.service;

import org.ecobay.user.member.domain.MemberVO;

	public interface MemberService {
	public void regist(MemberVO vo) throws Exception;
	
	public MemberVO read(String member_id) throws Exception;
	
	public void modify(MemberVO vo) throws Exception;
}
