package org.ecobay.admin.board.persistence;

import java.util.List;

import org.ecobay.admin.board.domain.FaqVO;

public interface FaqDAO {
	
	public void regist(FaqVO vo) throws Exception;
	
	public List<FaqVO> faqList() throws Exception;

}
