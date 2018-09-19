package org.ecobay.user.product.service;

import java.util.List;

import org.ecobay.user.product.domain.ProductImageVO;
import org.ecobay.user.product.domain.ProductVO;

public interface ProductService {
	public void insert(ProductVO vo) throws Exception;
	public boolean insert(ProductVO vo, List<ProductImageVO> imgListVo) throws Exception;
	public void delete(String product_cd) throws Exception;
	public ProductVO select(String product_cd) throws Exception;
	public List<ProductVO> selectList() throws Exception;
	public List<ProductVO> bigclassList() throws Exception;
	public List<ProductVO> midclassList(String class_big_cd) throws Exception;
	public int maxCnt(String searchVal) throws Exception; // 일련번호 구하기
	public void imgInsert(ProductImageVO vo) throws Exception;
}
