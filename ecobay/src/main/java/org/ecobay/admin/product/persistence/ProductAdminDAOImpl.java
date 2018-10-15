package org.ecobay.admin.product.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.ecobay.user.product.domain.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductAdminDAOImpl implements ProductAdminDAO {
	
	@Autowired
	private SqlSession session;
	
	private static String namespace = "org.ecobay.admin.mapper.ProductMapper";

	@Override
	public int productCount(ProductVO productVO) throws Exception {
		return session.selectOne(namespace + ".productCount", productVO);
	}

	@Override
	public List<ProductVO> productList(ProductVO productVO) throws Exception {
		return session.selectList(namespace + ".productList", productVO);
	}

	@Override
	public int reqProductCount(ProductVO productVO) throws Exception {
		return session.selectOne(namespace + ".reqProductCount", productVO);
	}

	@Override
	public List<ProductVO> reqProductList(ProductVO productVO) throws Exception {
		return session.selectList(namespace + ".reqProductList", productVO);
	}

	@Override
	public void updateProductState(ProductVO productVO) throws Exception {
		session.update(namespace + ".updateProductState", productVO);
	}
}
