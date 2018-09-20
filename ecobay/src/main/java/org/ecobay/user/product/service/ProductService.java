package org.ecobay.user.product.service;

import java.util.List;

import org.ecobay.user.product.domain.ProductVO;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

public interface ProductService {
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Throwable.class)
	public void insert(ProductVO vo);
	
	public void delete(String product_cd) throws Exception;
	public ProductVO select(String product_cd) throws Exception;
	public List<ProductVO> selectList() throws Exception;
	public List<ProductVO> bigclassList() throws Exception;
	public List<ProductVO> midclassList(String class_big_cd) throws Exception;
}
