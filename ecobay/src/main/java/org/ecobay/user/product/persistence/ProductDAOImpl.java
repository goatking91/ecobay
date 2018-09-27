package org.ecobay.user.product.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.ecobay.user.product.domain.AuctionInfoVO;
import org.ecobay.user.product.domain.BibInfoVO;
import org.ecobay.user.product.domain.DeliveryInfoVO;
import org.ecobay.user.product.domain.ProductImageVO;
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
	public List<BibInfoVO> selectBibList(String product_cd) throws Exception {
		return session.selectList(namespace + ".selectBibList", product_cd);
	}

	@Override
	public List<ProductImageVO> selectImageList(String product_cd) throws Exception {
		return session.selectList(namespace + ".selectImageList",product_cd);
	}
	
	
}
