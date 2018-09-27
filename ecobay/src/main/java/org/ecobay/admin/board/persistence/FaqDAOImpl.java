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

	
	
}
