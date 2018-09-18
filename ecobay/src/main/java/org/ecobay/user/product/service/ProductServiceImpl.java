package org.ecobay.user.product.service;

import java.util.List;

import org.ecobay.user.product.domain.ProductVO;
import org.ecobay.user.product.persistence.ProductDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	ProductDAO dao;

	@Override
	public void insert(ProductVO vo) throws Exception {
		dao.insert(vo);
	}

	@Override
	public void delete(String product_cd) throws Exception {
		dao.delete(product_cd);
	}

	@Override
	public ProductVO select(String product_cd) throws Exception {
		return dao.select(product_cd);
	}

	@Override
	public List<ProductVO> selectList() throws Exception {
		return dao.selectList();
	}

	@Override
	public List<ProductVO> bigclassList() throws Exception {
		return dao.bigclassList();
	}
	
	@Override
	public List<ProductVO> midclassList(String class_big_cd) throws Exception {
		return dao.midclassList(class_big_cd);
	}

	@Override
	public int maxCnt(String searchVal) throws Exception {
		return dao. maxCnt(searchVal);
	}
}
