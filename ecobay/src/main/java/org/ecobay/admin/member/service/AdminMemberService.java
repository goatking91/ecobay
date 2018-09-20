package org.ecobay.admin.member.service;

import java.util.List;

import org.ecobay.user.member.domain.MemberVO;

	public interface AdminMemberService {
	
		public List<MemberVO> listAll() throws Exception;
		
		public int count() throws Exception;

}