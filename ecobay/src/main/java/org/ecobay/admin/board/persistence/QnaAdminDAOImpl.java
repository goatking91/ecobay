package org.ecobay.admin.board.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ecobay.admin.board.domain.QnaVO;
import org.springframework.stereotype.Repository;

@Repository
public class QnaAdminDAOImpl implements QnaAdminDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.ecobay.admin.mapper.QnaMapper";

	@Override
	public List<QnaVO> qnaList() throws Exception {
		return session.selectList(namespace + ".selectQnaList");	
	}
	
	@Override
	public QnaVO qnaLoad(int qna_idx) throws Exception {
		return session.selectOne(namespace + ".selectQnaOne", qna_idx);
	}

}
