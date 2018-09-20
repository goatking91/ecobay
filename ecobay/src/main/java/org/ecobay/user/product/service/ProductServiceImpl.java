package org.ecobay.user.product.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.ecobay.user.product.domain.AuctionInfoVO;
import org.ecobay.user.product.domain.DeliveryInfoVO;
import org.ecobay.user.product.domain.ProductImageVO;
import org.ecobay.user.product.domain.ProductVO;
import org.ecobay.user.product.persistence.ProductDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	ProductDAO dao;

	@Override
	@Transactional(rollbackFor = Throwable.class) // 모든 Exception 발생시 //Exception.class : IOException오류시 / SQLException - SQL 오류시 롤백
	public void insert(ProductVO vo) {
		int imgCd = 0;
		int iMaxCnt = 0;
		String sDate = "";
		String searchVal = "";
		String sProductCd = "";
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyMMdd");
		
		// 1. 상풍코드 생성 - [상품코드[상품코드(14자리) : 대분류코드(2자리) + 중분코드(2자리) + 날짜(yyMMdd(6자리)) + 일련번호(4자리) ]
		sDate = transFormat.format(new Date()); // 1.1. 오늘 날짜 추출.
		searchVal = vo.getClass_big_cd() + vo.getClass_mid_cd() + sDate; // 1.2. 일련번호 앞까지 기본틀 만들기.
		iMaxCnt = dao.maxCnt(searchVal); // 1.3. 일련번호 생성.
		sProductCd = searchVal + String.format("%04d", iMaxCnt); // 1.4. 일련번호 자릿수 맞추기( ex> 0001 )
		vo.setProduct_cd(sProductCd); // 1.5. 생성한 상품코드를 상품정보에 넣기.
		
		System.out.println("sProductCd = " + sProductCd);

		if(sProductCd.equals("") == false && sProductCd != null) {
			//dao.insert(vo); // 2. 상품테이블에 저장.
			
			// 3. 상품이미지테이블에 한 행씩 저장.
			if(vo.getIvo() != null && vo.getIvo().size() > 0)
			{
				imgCd = dao.maxImgCnt();
				
				for(ProductImageVO imageVO : vo.getIvo()) {
					imageVO.setImg_cd(imgCd);
					imageVO.setProduct_cd(sProductCd);

					//dao.imageInsert(imageVO); 
				}
			}
			
			// 4. 경매설정 저장.
			if(vo.getAvo() != null)
			{
				System.out.println("auctVO");
				
				int acutUnit = 0;
				Date dateStart = new Date();
				Date dateEnd = new Date();
				
				AuctionInfoVO auctVO = vo.getAvo();
				
				auctVO.setProduct_cd(sProductCd);
				// 경매 시작일시와 경매기간에 따른 경매종료일시 처리.
				acutUnit = auctVO.getAuctdate_unit();
				System.out.println("acutUnit = " + acutUnit);
				
				dateStart = auctVO.getAcutdate_start();
				System.out.println("dateStart = " + dateStart.toLocaleString());
				
				dateEnd.setDate(dateStart.getDate() + acutUnit);
				System.out.println("dateEnd = " + dateStart.toLocaleString());
				
				//dao.auctInsert(auctVO);				
			}

			// 5. 배송설정 저장.
			if(vo.getDvo() != null)
			{
				System.out.println("deliVO");
				
				DeliveryInfoVO deliVO = vo.getDvo();
				deliVO.setProduct_cd(sProductCd);
				//dao.deliInsert(deliVO);
			}
		}
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
}
