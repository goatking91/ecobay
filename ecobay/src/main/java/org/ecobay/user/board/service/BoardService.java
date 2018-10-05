package org.ecobay.user.board.service;

import java.util.List;

import org.ecobay.admin.board.domain.NoticeVO;

public interface BoardService {
		
		/* FAQ */	
		//public List<FaqVO> faqList() throws Exception;
		
		//public FaqVO faqLoad(int faq_idx) throws Exception;
		
		
		
		/* NOTICE */
		public List<NoticeVO> noticeList() throws Exception;
		
		public NoticeVO noticeLoad(int notice_idx) throws Exception;
		
		public void noticeViewCnt (int notice_idx) throws Exception;
		
		
		/* QNA */
		//public List<QnaVO> qnaList() throws Exception;
		
		
}
