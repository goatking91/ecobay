package org.ecobay.admin.product.service;

import java.util.List;

import org.ecobay.admin.product.persistence.ProductAdminDAO;
import org.ecobay.user.product.domain.AuctionInfoVO;
import org.ecobay.user.product.domain.DeliveryInfoVO;
import org.ecobay.user.product.domain.ProductImageVO;
import org.ecobay.user.product.domain.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductAdminServiceImpl implements ProductAdminService {
	@Autowired
	private ProductAdminDAO dao;

	@Override
	public int productCount(ProductVO productVO) throws Exception {
		return dao.productCount(productVO);
	}

	@Override
	public List<ProductVO> productList(ProductVO productVO) throws Exception {
		return dao.productList(productVO);
	}

	@Override
	public int reqProductCount(ProductVO productVO) throws Exception {
		return dao.reqProductCount(productVO);
	}

	@Override
	public List<ProductVO> reqProductList(ProductVO productVO) throws Exception {
		return dao.reqProductList(productVO);
	}

	@Override
	public void updateProductState(ProductVO productVO) throws Exception {
		dao.updateProductState(productVO);
	}

	@Override
	public ProductVO selectDetailProd(String product_cd) throws Exception {
		return dao.selectDetailProd(product_cd);
	}

	@Override
	public AuctionInfoVO selectDetailAuct(String product_cd) throws Exception {
		return dao.selectDetailAuct(product_cd);
	}

	@Override
	public DeliveryInfoVO selectDetailDeli(String product_cd) throws Exception {
		return dao.selectDetailDeli(product_cd);
	}

	@Override
	public List<ProductImageVO> selectImageList(String product_cd) throws Exception {
		return dao.selectImageList(product_cd);
	}
}
