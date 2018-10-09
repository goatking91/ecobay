package org.ecobay.user.product.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.ecobay.user.product.domain.AuctionInfoVO;
import org.ecobay.user.product.domain.BidInfoVO;
import org.ecobay.user.product.domain.DeliveryInfoVO;
import org.ecobay.user.product.domain.ProductImageVO;
import org.ecobay.user.product.domain.ProductQnaVO;
import org.ecobay.user.product.domain.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SqlSession session;
	
	private static String namespace = "org.ecobay.user.mapper.ProductMapper";

	@Override
	public void insert(ProductVO vo) {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public void imageInsert(ProductImageVO imagevo) {
		session.insert(namespace + ".imageInsert", imagevo);
	}
	
	@Override
	public void auctInsert(AuctionInfoVO auctvo) {
		session.insert(namespace + ".auctInsert", auctvo);
	}

	@Override
	public void deliInsert(DeliveryInfoVO delivo) {
		session.insert(namespace + ".deliInsert", delivo);
	}
	
	
	@Override
	public void delete(String product_cd) throws Exception {
		session.update(namespace + ".delete", product_cd);
	}

	@Override
	public ProductVO selectDetailProd(String product_cd) throws Exception {
		return session.selectOne(namespace + ".selectDetailProd", product_cd);
	}
	
	@Override
	public AuctionInfoVO selectDetailAuct(String product_cd) throws Exception {
		return session.selectOne(namespace + ".selectDetailAuct", product_cd);
	}

	@Override
	public DeliveryInfoVO selectDetailDeli(String product_cd) throws Exception {
		return session.selectOne(namespace + ".selectDetailDeli", product_cd);
	}
	
	@Override
	public List<ProductVO> selectList(ProductVO vo) throws Exception {
		return session.selectList(namespace + ".selectList", vo);
	}

	@Override
	public List<ProductVO> bigclassList() throws Exception {
		return session.selectList(namespace + ".bigclassList");
	}

	@Override
	public List<ProductVO> midclassList(String class_big_cd) throws Exception {
		return session.selectList(namespace + ".midclassList", class_big_cd);
	}

	@Override
	public int maxCnt(String searchVal) {
		return session.selectOne(namespace + ".maxCnt", searchVal);
	}

	@Override
	public int maxImgCnt() {
		return session.selectOne(namespace + ".maxImgCnt");
	}
	
	@Override
	public int maxQnaCnt() {
		return session.selectOne(namespace + ".maxQnaCnt");
	}
	
	@Override
	public List<BidInfoVO> selectBidList(BidInfoVO vo) throws Exception {
		return session.selectList(namespace + ".selectBidList", vo);
	}

	@Override
	public List<ProductImageVO> selectImageList(String product_cd) throws Exception {
		return session.selectList(namespace + ".selectImageList",product_cd);
	}

	@Override
	public void prodQnaInsert(ProductQnaVO vo) {
		session.insert(namespace + ".prodQnaInsert", vo);
	}

	@Override
	public void prodQnaDelete(int qna_idx) throws Exception {
		session.delete(namespace + ".prodQnaDelete", qna_idx);
	}

	@Override
	public List<ProductQnaVO> selectProdQnaList(ProductQnaVO vo) throws Exception {
		return session.selectList(namespace + ".selectProdQnaList",vo);
	}

	@Override
	public List<ProductVO> selectListBest(ProductVO vo) throws Exception {
		return session.selectList(namespace + ".selectListBest", vo);
	}

	@Override
	public int ProdQnaAllCnt(String product_cd) throws Exception {
		return session.selectOne(namespace + ".ProdQnaAllCnt", product_cd);
	}

	@Override
	public int BidAllCnt(String product_cd) throws Exception {
		return session.selectOne(namespace + ".BidAllCnt", product_cd);
	}

	@Override
	public BidInfoVO selectMaxMoneyBid(String product_cd) throws Exception {
		return session.selectOne(namespace + ".selectMaxMoneyBid", product_cd);
	}

	@Override
	public void bidInsert(BidInfoVO vo) throws Exception {
		session.insert(namespace + ".bidInsert", vo);
	}

	@Override
	public int selectProdviewcnt(String product_cd) throws Exception {
		return session.selectOne(namespace + ".selectProdviewcnt", product_cd);
	}

	@Override
	public void updateProdViewCnt(ProductVO vo) throws Exception {
		session.update(namespace + ".updateProdViewCnt", vo);
	}

	@Override
	public void prodWishInsert(ProductVO vo) throws Exception {
		session.insert(namespace + ".prodWishInsert", vo);
	}
}
