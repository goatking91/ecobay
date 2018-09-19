package org.ecobay.user.product.persistence;

import java.util.List;

import org.ecobay.user.product.domain.ProductImageVO;
import org.ecobay.user.product.domain.ProductVO;

public interface ProductDAO {
	
	public void insert(ProductVO vo);
	public void imageListinsert(ProductImageVO imagevo);
	public void delete(String product_cd) throws Exception;
	public ProductVO select(String product_cd) throws Exception;
	public List<ProductVO> selectList() throws Exception;
	public List<ProductVO> bigclassList() throws Exception;
	public List<ProductVO> midclassList(String class_big_cd) throws Exception;
	public int maxCnt(String searchVal) throws Exception; // 상품코드 - 해당분류의 일련번호 구하기
	
	public int maxImgCnt(); // 상품이미지코드의 최대값 구하기
}
