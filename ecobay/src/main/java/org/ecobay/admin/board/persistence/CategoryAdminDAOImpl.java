package org.ecobay.admin.board.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ecobay.admin.board.domain.CategoryVO;
import org.ecobay.admin.board.domain.QnaReplyVO;
import org.ecobay.admin.board.domain.QnaVO;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryAdminDAOImpl implements CategoryAdminDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.ecobay.admin.mapper.CategoryMapper";

	@Override
	public CategoryVO categoryLoad(String category_cd) throws Exception {
		return session.selectOne(namespace + ".selectCategory", category_cd);
	}

	@Override
	public List<CategoryVO> categoryList() throws Exception {
		return session.selectList(namespace + ".selectCategoryList");
	}

}
