package org.ecobay.user.product.persistence;

import java.util.List;

import org.ecobay.user.product.domain.ProductVO;

public interface ProductDAO {
	
	public void insert(ProductVO vo) throws Exception;
	public void delete(String product_cd) throws Exception;
	public ProductVO select(String product_cd) throws Exception;
	public List<ProductVO> selectList() throws Exception;
	public List<ProductVO> classList(String class_big_cd) throws Exception;
	public int maxCnt(String searchVal) throws Exception; // 일련번호 구하기
}
