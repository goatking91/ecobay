package org.ecobay.admin.product.service;

import java.util.List;

import org.ecobay.user.product.domain.AuctionInfoVO;
import org.ecobay.user.product.domain.DeliveryInfoVO;
import org.ecobay.user.product.domain.ProductImageVO;
import org.ecobay.user.product.domain.ProductVO;

public interface ProductAdminService {
	public int productCount(ProductVO productVO) throws Exception;
	public List<ProductVO> productList(ProductVO productVO) throws Exception;
	public int reqProductCount(ProductVO productVO) throws Exception;
	public List<ProductVO> reqProductList(ProductVO productVO) throws Exception;
	
	public void updateProductState(ProductVO productVO) throws Exception;
	
	public ProductVO selectDetailProd(String product_cd) throws Exception;
	public AuctionInfoVO selectDetailAuct(String product_cd) throws Exception;
	public DeliveryInfoVO selectDetailDeli(String product_cd) throws Exception;
	public List<ProductImageVO> selectImageList(String product_cd) throws Exception;
}
