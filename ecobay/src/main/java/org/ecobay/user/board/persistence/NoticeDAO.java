package org.ecobay.user.board.persistence;

import java.util.List;

import org.ecobay.admin.board.domain.NoticeVO;

public interface NoticeDAO {
	
	public List<NoticeVO> noticeList(NoticeVO vo) throws Exception;
	
	public NoticeVO noticeLoad(int notice_idx) throws Exception;

	public void noticeViewCnt(int notice_idx) throws Exception;
	
	public List<NoticeVO> ajaxNoticeTopList() throws Exception;
	
	public int selectNoticeListCnt(NoticeVO vo) throws Exception;

}
