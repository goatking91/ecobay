package org.ecobay.admin.member.persistence;

import java.util.List;

import org.ecobay.user.member.domain.MemberVO;

public interface AdminMemberDAO {

	public List<MemberVO> listAll() throws Exception;
	
	public int count() throws Exception;
	

}
