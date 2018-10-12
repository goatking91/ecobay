package org.ecobay.admin.board.persistence;

import java.util.List;

import org.ecobay.admin.board.domain.QnaReplyVO;
import org.ecobay.admin.board.domain.QnaVO;

public interface QnaAdminDAO {
	
	public List<QnaVO> qnaList(QnaVO qnaVO) throws Exception;
	
	public QnaVO qnaLoad(int qna_idx) throws Exception;
	
	public void qnaReplyRegist(QnaReplyVO vo) throws Exception;
	
	public void qnaReplyDelete(int qnarp_idx) throws Exception;
	
	public int selectQnaListCnt(QnaVO vo) throws Exception;
	
	public void qnaDelete(int qna_idx) throws Exception;

}
