package org.ecobay.admin.board.service;

import java.util.List;

import org.ecobay.admin.board.domain.FaqVO;
import org.ecobay.admin.board.domain.NoticeVO;
import org.ecobay.admin.board.domain.QnaVO;

public interface BoardAdminService {
		
		/* FAQ */
		public void faqRegist(FaqVO vo) throws Exception;
		
		public List<FaqVO> faqList() throws Exception;
		
		public FaqVO faqLoad(int faq_idx) throws Exception;
		
		public void faqUpdate(FaqVO vo) throws Exception;
		
		public void faqDelete(int faq_idx) throws Exception;
		
		
		/* NOTICE */
		public void noticeRegist(NoticeVO vo) throws Exception;
		
		public List<NoticeVO> noticeList() throws Exception;
		
		public NoticeVO noticeLoad(int notice_idx) throws Exception;
		
		public void noticeUpdate(NoticeVO vo) throws Exception;
		
		public void noticeDelete(int notice_idx) throws Exception;
		
		public void noticeViewCnt (int notice_idx) throws Exception;
		
		
		/* QNA */
		public List<QnaVO> qnaList() throws Exception;
		
		
}
