package org.ecobay.user.product.service;

import java.util.List;

import org.ecobay.user.product.domain.AuctionInfoVO;
import org.ecobay.user.product.domain.BibInfoVO;
import org.ecobay.user.product.domain.DeliveryInfoVO;
import org.ecobay.user.product.domain.ProductImageVO;
import org.ecobay.user.product.domain.ProductVO;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

public interface ProductService {
	@Transactional(propagation=Propagation.REQUIRED)
	public void insert(ProductVO vo);
	
	public void delete(String product_cd) throws Exception;
	public ProductVO selectDetailProd(String product_cd) throws Exception;
	public AuctionInfoVO selectDetailAuct(String product_cd) throws Exception;
	public DeliveryInfoVO selectDetailDeli(String product_cd) throws Exception;
	
	public List<ProductVO> selectList(ProductVO vo) throws Exception;
	public List<ProductVO> bigclassList() throws Exception;
	public List<ProductVO> midclassList(String class_big_cd) throws Exception;
	
	public List<BibInfoVO> selectBibList(String product_cd) throws Exception;
	public List<ProductImageVO> selectImageList(String product_cd) throws Exception;
}
