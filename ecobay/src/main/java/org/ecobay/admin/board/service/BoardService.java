package org.ecobay.admin.board.service;

import java.util.List;

import org.ecobay.admin.board.domain.FaqVO;

public interface BoardService {
		
		public void FaqRegist(FaqVO vo) throws Exception;
		
		public List<FaqVO> faqList() throws Exception;

}
