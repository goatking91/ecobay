package org.ecobay.user.member.persistence;

import java.util.List;

import org.ecobay.user.member.domain.MemberVO;

public interface MemberDAO {
	public void create(MemberVO vo) throws Exception;
	
	public MemberVO read(String member_id) throws Exception;
	
	public void update(MemberVO vo) throws Exception;
	
	public void delete(String member_id) throws Exception;
	
	public List<MemberVO> listAll() throws Exception;
	
	public int count() throws Exception;
	
	public void verify(MemberVO vo) throws Exception;
}
