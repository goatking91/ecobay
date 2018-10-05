package org.ecobay.admin.board.persistence;

import java.util.List;

import org.ecobay.admin.board.domain.QnaVO;

public interface QnaAdminDAO {
	
	public List<QnaVO> qnaList() throws Exception;
	
	public QnaVO qnaLoad(int qna_idx) throws Exception;
	

}
