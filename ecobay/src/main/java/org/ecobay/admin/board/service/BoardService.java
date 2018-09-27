package org.ecobay.admin.board.service;

import java.util.List;

import org.ecobay.admin.board.domain.FaqVO;

public interface BoardService {
		
		public void FaqRegist(FaqVO vo) throws Exception;
		
		public List<FaqVO> faqList() throws Exception;
		
		public FaqVO faqLoad(int faq_idx) throws Exception;
		
		public void faqUpdate(FaqVO vo) throws Exception;
		
		public void faqDelete(int faq_idx) throws Exception;
		
}
