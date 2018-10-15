package org.ecobay.admin.product.persistence;

import java.util.List;

import org.ecobay.user.product.domain.ProductVO;

public interface ProductAdminDAO {
	public int productCount(ProductVO productVO) throws Exception;
	public List<ProductVO> productList(ProductVO productVO) throws Exception;
	
	public int reqProductCount(ProductVO productVO) throws Exception;
	public List<ProductVO> reqProductList(ProductVO productVO) throws Exception;
	
	public void updateProductState(ProductVO productVO) throws Exception;
}
