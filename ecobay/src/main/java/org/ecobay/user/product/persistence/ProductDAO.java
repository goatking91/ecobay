package org.ecobay.user.product.persistence;

import java.util.List;

import org.ecobay.user.product.domain.AuctionInfoVO;
import org.ecobay.user.product.domain.BidInfoVO;
import org.ecobay.user.product.domain.DeliveryInfoVO;
import org.ecobay.user.product.domain.ProductImageVO;
import org.ecobay.user.product.domain.ProductQnaVO;
import org.ecobay.user.product.domain.ProductVO;

public interface ProductDAO {

	public int maxCnt(String searchVal); // 상품코드 - 해당분류의 일련번호 구하기
	public int maxImgCnt(); // 상품이미지코드의 최대값 구하기
	public int maxQnaCnt(); // 상품문의코드의 최대값 구하기
	
	public int ProdQnaAllCnt(String product_cd) throws Exception; // 상품문의 총 갯수 구하기(페이징용)
	public int BidAllCnt(String product_cd) throws Exception; // 입찰내역 총 갯수 구하기(페이징용)
	
	public int selectProdviewcnt(String product_cd) throws Exception;
	public void updateProdViewCnt(ProductVO vo) throws Exception;
	
	public void insert(ProductVO vo);
	public void delete(String product_cd) throws Exception;
	
	public void imageInsert(ProductImageVO imagevo);
	public void auctInsert(AuctionInfoVO auctvo);
	public void deliInsert(DeliveryInfoVO delivo);
	
	public void prodWishInsert(ProductVO vo) throws Exception;
	
	public ProductVO selectDetailProd(String product_cd) throws Exception;
	public AuctionInfoVO selectDetailAuct(String product_cd) throws Exception;
	public DeliveryInfoVO selectDetailDeli(String product_cd) throws Exception;
	
	public List<ProductVO> selectList(ProductVO vo) throws Exception;
	public List<ProductVO> bigclassList() throws Exception;
	public List<ProductVO> midclassList(String class_big_cd) throws Exception;
	
	public void bidInsert(BidInfoVO vo) throws Exception;
	public BidInfoVO selectMaxMoneyBid(String product_cd) throws Exception;
	public List<BidInfoVO> selectBidList(BidInfoVO vo) throws Exception;
	
	public List<ProductImageVO> selectImageList(String product_cd) throws Exception;
	
	public void prodQnaInsert(ProductQnaVO vo);
	public void prodQnaDelete(int qna_idx) throws Exception;
	public List<ProductQnaVO> selectProdQnaList(ProductQnaVO vo) throws Exception;
	
	public List<ProductVO> selectListBest(ProductVO vo) throws Exception;
}
