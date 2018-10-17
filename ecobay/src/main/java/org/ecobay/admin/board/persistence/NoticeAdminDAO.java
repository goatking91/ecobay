package org.ecobay.admin.board.persistence;

import java.util.List;

import org.ecobay.admin.board.domain.NoticeFileVO;
import org.ecobay.admin.board.domain.NoticeVO;
import org.ecobay.admin.board.domain.QnaVO;

public interface NoticeAdminDAO {
	
	public void noticeRegist(NoticeVO vo) throws Exception;
	
	public List<NoticeVO> noticeList(NoticeVO noticeVO) throws Exception;
	
	public NoticeVO noticeLoad(int notice_idx) throws Exception;
	
	public void noticeUpdate(NoticeVO vo) throws Exception;
	
	public void noticeDelete(int notice_idx) throws Exception;
	
	public void noticeViewCnt(int notice_idx) throws Exception;
	
	public void noticeFileInsert(NoticeFileVO vo) throws Exception;
	
	public int maxNoticeFileCnt() throws Exception;
	
	public int maxNoticeIDX() throws Exception;
	
	public int selectNoticeListCnt(NoticeVO vo) throws Exception;
	
	public void noticeFileDelete(int file_idx) throws Exception;

}
