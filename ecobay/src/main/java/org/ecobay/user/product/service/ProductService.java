package org.ecobay.user.product.service;

import java.util.List;

import org.ecobay.user.product.domain.AuctionInfoVO;
import org.ecobay.user.product.domain.BidInfoVO;
import org.ecobay.user.product.domain.DeliveryInfoVO;
import org.ecobay.user.product.domain.ProductImageVO;
import org.ecobay.user.product.domain.ProductQnaVO;
import org.ecobay.user.product.domain.ProductVO;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

public interface ProductService {
	@Transactional(propagation=Propagation.REQUIRED)
	public void insert(ProductVO vo);
	public void delete(String product_cd) throws Exception;
	
	public int ProdQnaAllCnt(String product_cd) throws Exception; // 상품문의 총 갯수 구하기(페이징용)

	public ProductVO selectDetailProd(String product_cd) throws Exception;
	public AuctionInfoVO selectDetailAuct(String product_cd) throws Exception;
	public DeliveryInfoVO selectDetailDeli(String product_cd) throws Exception;
	
	public List<ProductVO> selectList(ProductVO vo) throws Exception;
	public List<ProductVO> bigclassList() throws Exception;
	public List<ProductVO> midclassList(String class_big_cd) throws Exception;
	
	public List<BidInfoVO> selectBidList(String product_cd) throws Exception;
	public List<ProductImageVO> selectImageList(String product_cd) throws Exception;

	public void prodQnaInsert(ProductQnaVO vo);
	public void prodQnaReplyInsert(ProductQnaVO vo);
	public void prodQnaDelete(int qna_idx) throws Exception;
	public List<ProductQnaVO> selectProdQnaList(ProductQnaVO vo) throws Exception;
	
	public List<ProductVO> selectListBest(ProductVO vo) throws Exception;
}
