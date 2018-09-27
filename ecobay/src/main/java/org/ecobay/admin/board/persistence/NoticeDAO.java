package org.ecobay.admin.board.persistence;

import java.util.List;

import org.ecobay.admin.board.domain.FaqVO;
import org.ecobay.admin.board.domain.NoticeVO;

public interface NoticeDAO {
	
	public void noticeRegist(NoticeVO vo) throws Exception;
	
	public List<NoticeVO> noticeList() throws Exception;
	
	public NoticeVO noticeLoad(int notice_idx) throws Exception;
	
	public void noticeUpdate(NoticeVO vo) throws Exception;
	
	public void noticeDelete(int notice_idx) throws Exception;
	
	public void noticeViewCnt(int notice_idx) throws Exception;
	


}
