package org.ecobay.user.product.persistence;

import java.util.List;

import org.ecobay.user.product.domain.AuctionInfoVO;
import org.ecobay.user.product.domain.BidInfoVO;
import org.ecobay.user.product.domain.DeliveryInfoVO;
import org.ecobay.user.product.domain.ProductImageVO;
import org.ecobay.user.product.domain.ProductVO;

public interface ProductDAO {

	public int maxCnt(String searchVal); // 상품코드 - 해당분류의 일련번호 구하기
	public int maxImgCnt(); // 상품이미지코드의 최대값 구하기
	
	public void insert(ProductVO vo);
	public void imageInsert(ProductImageVO imagevo);
	public void auctInsert(AuctionInfoVO auctvo);
	public void deliInsert(DeliveryInfoVO delivo);
	
	public void delete(String product_cd) throws Exception;
	public ProductVO selectDetailProd(String product_cd) throws Exception;
	public AuctionInfoVO selectDetailAuct(String product_cd) throws Exception;
	public DeliveryInfoVO selectDetailDeli(String product_cd) throws Exception;
	
	public List<ProductVO> selectList(ProductVO vo) throws Exception;
	public List<ProductVO> bigclassList() throws Exception;
	public List<ProductVO> midclassList(String class_big_cd) throws Exception;
	
	public List<BidInfoVO> selectBidList(String product_cd) throws Exception;
	public List<ProductImageVO> selectImageList(String product_cd) throws Exception;
}
