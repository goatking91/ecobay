package org.ecobay.user.board.service;

import java.util.List;

import org.ecobay.admin.board.domain.FaqVO;
import org.ecobay.admin.board.domain.NoticeVO;
import org.ecobay.admin.board.domain.QnaVO;

public interface BoardService {
		
		/* FAQ */	
		public List<FaqVO> faqList(FaqVO faqVO) throws Exception;
		
		public List<FaqVO> LoadFaqTopList() throws Exception;
		
		public int selectFaqListCnt(FaqVO faqVO) throws Exception;
		
		
		/* NOTICE */
		public List<NoticeVO> noticeList(NoticeVO vO) throws Exception;
		
		public NoticeVO noticeLoad(int notice_idx) throws Exception;
		
		public void noticeViewCnt (int notice_idx) throws Exception;
		
		public List<NoticeVO> LoadNoticeTopList() throws Exception;
		
		public int selectNoticeListCnt(NoticeVO noticeVO) throws Exception;
		
		
		/* QNA */
		public void qnaRegist(QnaVO vo) throws Exception;
		
		
		
		
}
