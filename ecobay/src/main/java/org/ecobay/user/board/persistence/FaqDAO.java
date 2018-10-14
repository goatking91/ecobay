package org.ecobay.user.board.persistence;

import java.util.List;

import org.ecobay.admin.board.domain.FaqVO;

public interface FaqDAO {
	
	public List<FaqVO> faqList(FaqVO faqVO) throws Exception;
	
	public List<FaqVO> ajaxFaqTopList() throws Exception;
	
	public int selectFaqListCnt(FaqVO faqVO) throws Exception;
	

}
