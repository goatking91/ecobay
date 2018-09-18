package org.ecobay.user.product.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.ecobay.user.product.domain.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SqlSession session;
	
	private static String namespace = "org.ecobay.user.mapper.ProductMapper";

	@Override
	public void insert(ProductVO vo) throws Exception {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public void delete(String product_cd) throws Exception {
		session.update(namespace + ".delete", product_cd);
	}

	@Override
	public ProductVO select(String product_cd) throws Exception {
		return session.selectOne(namespace + ".select", product_cd);
	}

	@Override
	public List<ProductVO> selectList() throws Exception {
		return session.selectList(namespace + ".selectList");
	}

	@Override
	public List<ProductVO> classList(String class_big_cd) throws Exception {
		return session.selectList(namespace + ".classList", class_big_cd);
	}

	@Override
	public int maxCnt(String searchVal) throws Exception {
		return session.selectOne(namespace + ".maxCnt", searchVal);
	}
}