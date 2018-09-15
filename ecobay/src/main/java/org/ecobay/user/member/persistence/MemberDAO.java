package org.ecobay.user.member.persistence;

import org.ecobay.user.member.domain.MemberVO;

public interface MemberDAO {
	public void create(MemberVO vo) throws Exception;
	
	public MemberVO read(String member_id) throws Exception;
	
	public void update(MemberVO vo) throws Exception;
}
