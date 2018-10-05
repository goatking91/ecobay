package org.ecobay.user.board.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ecobay.admin.board.domain.QnaVO;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDAOImpl implements QnaDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.ecobay.user.mapper.QnaMapper";


	@Override
	public void qnaRegist(QnaVO vo) throws Exception {
		session.insert(namespace + ".insertQna", vo);	
		
	}


}
