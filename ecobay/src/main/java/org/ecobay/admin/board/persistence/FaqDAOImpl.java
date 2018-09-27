package org.ecobay.admin.board.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ecobay.admin.board.domain.FaqVO;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDAOImpl implements FaqDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.ecobay.admin.mapper.FaqMapper";
	
	@Override
	public void regist(FaqVO vo) throws Exception {
		session.insert(namespace + ".insertFaq", vo);	
	}

	@Override
	public List<FaqVO> faqList() throws Exception {
		
		return session.selectList(namespace + ".selectFaqList");	
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
		session.update(namespace + ".deleteFaq", faq_idx);
	}

	
	
}
