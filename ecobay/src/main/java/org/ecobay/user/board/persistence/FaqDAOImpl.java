package org.ecobay.user.board.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ecobay.admin.board.domain.FaqVO;
import org.ecobay.admin.board.domain.QnaVO;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDAOImpl implements FaqDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.ecobay.user.mapper.FaqMapper";

	@Override
	public List<FaqVO> faqList(FaqVO faqVO) throws Exception {
		return session.selectList(namespace + ".selectFaqList", faqVO);	
	}

	@Override
	public List<FaqVO> ajaxFaqTopList() throws Exception {
		return session.selectList(namespace + ".selectFaqTopList");
	}

	@Override
	public int selectFaqListCnt(FaqVO faqVO) throws Exception {
		return session.selectOne(namespace + ".selectFaqListCnt", faqVO);
	}

}
