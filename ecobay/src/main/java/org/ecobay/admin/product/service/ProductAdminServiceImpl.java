package org.ecobay.admin.product.service;

import java.util.List;

import org.ecobay.admin.product.persistence.ProductAdminDAO;
import org.ecobay.user.product.domain.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductAdminServiceImpl implements ProductAdminService {
	@Autowired
	private ProductAdminDAO dao;

	@Override
	public int productCount(ProductVO productVO) throws Exception {
		return dao.productCount(productVO);
	}

	@Override
	public List<ProductVO> productList(ProductVO productVO) throws Exception {
		return dao.productList(productVO);
	}
}
