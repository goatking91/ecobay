package org.ecobay.admin.board.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ecobay.admin.board.domain.FaqVO;
import org.springframework.stereotype.Repository;

@Repository
public class FaqAdminDAOImpl implements FaqAdminDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.ecobay.admin.mapper.FaqMapper";
	
	@Override
	public void regist(FaqVO vo) throws Exception {
		session.insert(namespace + ".insertFaq", vo);	
	}

	@Override
	public List<FaqVO> faqList(FaqVO vo) throws Exception {
		return session.selectList(namespace + ".selectFaqList", vo);	
	}

	@Override
	public FaqVO faqLoad(int faq_idx) throws Exception {
		return session.selectOne(namespace + ".selectFaqOne", faq_idx);
	}

	@Override
	public void faqUpdate(FaqVO vo) throws Exception {
		session.update(namespace + ".updateFaq", vo);
	}

	@Override
	public void faqDelete(int faq_idx) throws Exception {
		session.delete(namespace + ".deleteFaq", faq_idx);
	}

	@Override
	public int selectFaqListCnt(FaqVO vo) throws Exception {
		return session.selectOne(namespace + ".selectFaqListCnt", vo);
	}

	
	
}
