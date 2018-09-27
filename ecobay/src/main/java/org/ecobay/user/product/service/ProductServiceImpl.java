package org.ecobay.user.product.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.ecobay.user.product.domain.AuctionInfoVO;
import org.ecobay.user.product.domain.BidInfoVO;
import org.ecobay.user.product.domain.DeliveryInfoVO;
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

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED) // 모든 Exception 발생시 //Exception.class : IOException오류시 / SQLException - SQL 오류시 롤백
	public void insert(ProductVO vo) {
		int imgCd = 0;
		int iMaxCnt = 0;
		String sDate = "";
		String searchVal = "";
		String sProductCd = "";
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyMMdd");
		SimpleDateFormat transDateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		// 1. 상풍코드 생성 - [상품코드[상품코드(14자리) : 대분류코드(2자리) + 중분코드(2자리) + 날짜(yyMMdd(6자리)) + 일련번호(4자리) ]
		sDate = transFormat.format(new Date()); // 1.1. 오늘 날짜 추출.
		searchVal = vo.getClass_big_cd() + vo.getClass_mid_cd() + sDate; // 1.2. 일련번호 앞까지 기본틀 만들기.
		iMaxCnt = dao.maxCnt(searchVal); // 1.3. 일련번호 생성.
		sProductCd = searchVal + String.format("%04d", iMaxCnt); // 1.4. 일련번호 자릿수 맞추기( ex> 0001 )
		vo.setProduct_cd(sProductCd); // 1.5. 생성한 상품코드를 상품정보에 넣기.
		
		System.out.println("sProductCd = " + sProductCd);

		if(sProductCd.equals("") == false && sProductCd != null) {
			dao.insert(vo); // 2. 상품테이블에 저장.
			
			// 3. 상품이미지테이블에 한 행씩 저장.
			if(vo.getIvo() != null && vo.getIvo().size() > 0)
			{
				if(vo.getIvo().get(0).getFilename() != null && vo.getIvo().get(0).getFilename().equals("") == false)
				{
					imgCd = dao.maxImgCnt();
					
					for(ProductImageVO imageVO : vo.getIvo()) {
						imageVO.setImg_cd(imgCd);
						imageVO.setProduct_cd(sProductCd);

						dao.imageInsert(imageVO);
					}
				}
			}
			
			// 4. 경매설정 저장.
			if(vo.getAvo() != null)
			{
				// 경매 시작일시와 경매기간에 따른 경매종료일시 처리.
				int acutUnit = 0;
				String DateStart_str = "";
				Date dateStart = null;
				Date dateEnd = null;
				java.util.Calendar dateEnd_cal = Calendar.getInstance();

				AuctionInfoVO auctVO = vo.getAvo();
				
				try 
				{
					acutUnit = auctVO.getAuctdate_unit();
					DateStart_str = auctVO.getAcutdate_start_str();
					dateStart = (Date) transDateTimeFormat.parse(DateStart_str);					

					dateEnd_cal.setTime(dateStart);
					dateEnd_cal.add(Calendar.DATE, acutUnit);
					
					dateEnd = (Date) transDateTimeFormat.parse(transDateTimeFormat.format(dateEnd_cal.getTime()));
				} catch (Exception ex) { ex.toString(); }
				
				auctVO.setProduct_cd(sProductCd);
				auctVO.setAcutdate_start(dateStart);
				auctVO.setAcutdate_end(dateEnd);
				
				dao.auctInsert(auctVO);
			}

			// 5. 배송설정 저장.
			if(vo.getDvo() != null)
			{
				System.out.println("deliVO");
				
				DeliveryInfoVO deliVO = vo.getDvo();
				deliVO.setProduct_cd(sProductCd);
				
				dao.deliInsert(deliVO);
			}
		}
	}
	
	@Override
	public void delete(String product_cd) throws Exception {
		dao.delete(product_cd);
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
	public List<ProductVO> selectList(ProductVO vo) throws Exception {
		/*List<ProductVO> list = new ArrayList<ProductVO>();
		
		for(ProductVO temp : dao.selectList(vo)) {
			String tmpPath = uploadPath+temp.getFilename_thumb();
			System.out.println(tmpPath);
			temp.setFilename_thumb(tmpPath);
			list.add(temp);
		}*/
		return dao.selectList(vo);
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
	public List<BidInfoVO> selectBidList(String product_cd) throws Exception {
		return dao.selectBidList(product_cd);
	}

	@Override
	public List<ProductImageVO> selectImageList(String product_cd) throws Exception {
		return dao.selectImageList(product_cd);
	}
	
}
