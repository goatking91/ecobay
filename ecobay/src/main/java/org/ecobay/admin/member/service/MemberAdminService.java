package org.ecobay.admin.member.service;

import java.util.List;

import org.ecobay.admin.member.domain.BlacklistVO;
import org.ecobay.user.member.domain.MemberVO;

public interface MemberAdminService {
	
		public List<MemberVO> memberList(MemberVO memberVO) throws Exception;
		
		public int memberListCount(MemberVO memberVO) throws Exception;
		
		public List<MemberVO> blackList(BlacklistVO blacklistVO) throws Exception;
		
		public int blackListCount(BlacklistVO blacklistVO) throws Exception;
		
		public void blackReg(BlacklistVO blacklistVO) throws Exception;
		
		public void rejoin(String member_id) throws Exception; 
		
		public void blackCan(BlacklistVO blacklistVO) throws Exception;
		
		public List<BlacklistVO> blackContent(String member_id) throws Exception;
}
