package org.ecobay.admin.member.persistence;

import java.util.List;

import org.ecobay.admin.member.domain.BlacklistVO;
import org.ecobay.user.member.domain.MemberVO;

public interface MemberAdminDAO {

	public List<MemberVO> memberList(MemberVO memberVO) throws Exception;
	
	public int memberListCount(MemberVO memberVO) throws Exception;
	
	public List<MemberVO> blackList(BlacklistVO blacklistVO) throws Exception;
	
	public int blackListCount(BlacklistVO blacklistVO) throws Exception;
	
	public void blackRegId(String member_id) throws Exception;
	
	public void blackRegContent(BlacklistVO blacklistVO) throws Exception;
	
	public void rejoin(String member_id) throws Exception;
	
	public void blackCanId(String member_id) throws Exception;
	
	public void blackCanContent(BlacklistVO blacklistVO) throws Exception;
	
	public List<BlacklistVO> blackContent(String member_id) throws Exception;
}
