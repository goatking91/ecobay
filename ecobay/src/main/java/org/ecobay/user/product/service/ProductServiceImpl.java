package org.ecobay.user.product.service;

import java.util.List;

import org.ecobay.user.product.domain.ProductImageVO;
import org.ecobay.user.product.domain.ProductVO;
import org.ecobay.user.product.persistence.ProductDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	ProductDAO dao;

	@Override
	public void insert(ProductVO vo) throws Exception {
		dao.insert(vo);
	}

	@Override
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public boolean insert(ProductVO vo, List<ProductImageVO> imgListVo) {
		int idx = 1;
		int cnt = 0;
		int imgCd = 0;
		String sProductCd = "";
		
		boolean retVal = false;
		
		sProductCd = vo.getProduct_cd();
		
		if(sProductCd.equals("") == false || sProductCd != null) {
			dao.insert(vo);
			
			ProductImageVO imageVO = new ProductImageVO();
			
			cnt = imgListVo.size();
			
			if(cnt > 0) {
				imgCd = dao.maxImgCnt();
				
				for(int i = 0; i < cnt; i++) {
					imageVO = imgListVo.get(i);
					
					imageVO.setImg_cd(imgCd);
					imageVO.setProduct_cd(sProductCd);
					imageVO.setImg_idx(idx);
		 			
					dao.imageListinsert(imageVO);
				}
			}
			retVal = true;
		}
		return retVal;
	}
	
	@Override
	public void delete(String product_cd) throws Exception {
		dao.delete(product_cd);
	}

	@Override
	public ProductVO select(String product_cd) throws Exception {
		return dao.select(product_cd);
	}

	@Override
	public List<ProductVO> selectList() throws Exception {
		return dao.selectList();
	}

	@Override
	public List<ProductVO> bigclassList() throws Exception {
		return dao.bigclassList();
	}
	
	@Override
	public List<ProductVO> midclassList(String class_big_cd) throws Exception {
		return dao.midclassList(class_big_cd);
	}

	@Override
	public int maxCnt(String searchVal) throws Exception {
		return dao. maxCnt(searchVal);
	}

	@Override
	public void imgInsert(ProductImageVO vo) throws Exception {
		dao.imgInsert(vo);
	}
}
