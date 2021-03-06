package org.ecobay.user.product.domain;

import java.util.Date;
import java.util.List;

public class ProductVO {
	// ==== PRODUCT(상품테이블) ==== //
	private String product_cd;
	private String product_nm;
	private String member_id;
	private String member_nm;
	private String class_big_cd;
	private String class_big_nm;
	private String class_mid_cd;
	private String class_mid_nm;
	private String content;
	private String state_cd;
	private String state_nm;
	private Date regdate;
	private Date moddate;
	private Date deldate;
	private Boolean use_yn;
	private int viewcnt;
	
	private List<ProductImageVO> ivo;
	private AuctionInfoVO avo;
	private DeliveryInfoVO dvo;

	private int rn;
	private String searchVal; // 검색어

	// 상품리스트 검색용.
	private int start_num;
	private int end_num;
	
	// 상품 출력용 추가.
	private int bid_cnt; // 입찰수
	private long bid_max_money; // 최대입찰금액
	private String filename_thumb; // 썸네일파일명
	private String acutdate_start_str; // 경매시작일시(String)
	private String acutdate_end_str; // 경매종료일시(String)
	private long money_first; // 시작가
	private long money_pay; // 결제금액
	private String deli_div_cd; //배송구분코드
	private String deli_div_nm; //배송구분명
	
	
	/** 페이징 **/
	private int startIndex;
	private int cntPerPage;
	private int movePage;
	
	/** 검색 **/
	private String searchType;
	private String keyWord;
	
	public ProductVO() { 
		
	}

	public ProductVO(String product_cd, String product_nm, String member_id, String member_nm,
			String class_big_cd, String class_big_nm,
			String class_mid_cd, String class_mid_nm, String content, String state_cd, String state_nm, Date regdate,
			Date moddate, Date deldate, Boolean use_yn, int viewcnt, List<ProductImageVO> ivo, AuctionInfoVO avo,
			DeliveryInfoVO dvo, int rn, String searchVal, int start_num, int end_num, int bid_cnt, long bid_max_money,
			String filename_thumb, String acutdate_start_str, String acutdate_end_str, long money_first, long money_pay,
			String deli_div_cd, String deli_div_nm,
			int startIndex, int cntPerPage, int movePage, String searchType, String keyWord) {
		super();
		this.product_cd = product_cd;
		this.product_nm = product_nm;
		this.member_id = member_id;
		this.member_nm = member_nm;
		this.class_big_cd = class_big_cd;
		this.class_big_nm = class_big_nm;
		this.class_mid_cd = class_mid_cd;
		this.class_mid_nm = class_mid_nm;
		this.content = content;
		this.state_cd = state_cd;
		this.state_nm = state_nm;
		this.regdate = regdate;
		this.moddate = moddate;
		this.deldate = deldate;
		this.use_yn = use_yn;
		this.viewcnt = viewcnt;
		this.ivo = ivo;
		this.avo = avo;
		this.dvo = dvo;
		this.rn = rn;
		this.searchVal = searchVal;
		this.start_num = start_num;
		this.end_num = end_num;
		this.bid_cnt = bid_cnt;
		this.bid_max_money = bid_max_money;
		this.filename_thumb = filename_thumb;
		this.acutdate_start_str = acutdate_start_str;
		this.acutdate_end_str = acutdate_end_str;
		this.money_first = money_first;
		this.money_pay = money_pay;
		this.deli_div_cd = deli_div_cd;
		this.deli_div_nm = deli_div_nm;
		this.startIndex = startIndex;
		this.cntPerPage = cntPerPage;
		this.movePage = movePage;
		this.searchType = searchType;
		this.keyWord = keyWord;
	}


	public String getProduct_cd() {
		return product_cd;
	}

	public void setProduct_cd(String product_cd) {
		this.product_cd = product_cd;
	}

	public String getProduct_nm() {
		return product_nm;
	}

	public void setProduct_nm(String product_nm) {
		this.product_nm = product_nm;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public String getMember_nm() {
		return member_nm;
	}

	public void setMember_nm(String member_nm) {
		this.member_nm = member_nm;
	}

	public String getClass_big_cd() {
		return class_big_cd;
	}

	public void setClass_big_cd(String class_big_cd) {
		this.class_big_cd = class_big_cd;
	}

	public String getClass_big_nm() {
		return class_big_nm;
	}

	public void setClass_big_nm(String class_big_nm) {
		this.class_big_nm = class_big_nm;
	}

	public String getClass_mid_cd() {
		return class_mid_cd;
	}

	public void setClass_mid_cd(String class_mid_cd) {
		this.class_mid_cd = class_mid_cd;
	}

	public String getClass_mid_nm() {
		return class_mid_nm;
	}

	public void setClass_mid_nm(String class_mid_nm) {
		this.class_mid_nm = class_mid_nm;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getState_cd() {
		return state_cd;
	}

	public void setState_cd(String state_cd) {
		this.state_cd = state_cd;
	}

	public String getState_nm() {
		return state_nm;
	}

	public void setState_nm(String state_nm) {
		this.state_nm = state_nm;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getModdate() {
		return moddate;
	}

	public void setModdate(Date moddate) {
		this.moddate = moddate;
	}

	public Date getDeldate() {
		return deldate;
	}

	public void setDeldate(Date deldate) {
		this.deldate = deldate;
	}

	public Boolean getUse_yn() {
		return use_yn;
	}

	public void setUse_yn(Boolean use_yn) {
		this.use_yn = use_yn;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public List<ProductImageVO> getIvo() {
		return ivo;
	}

	public void setIvo(List<ProductImageVO> ivo) {
		this.ivo = ivo;
	}

	public AuctionInfoVO getAvo() {
		return avo;
	}

	public void setAvo(AuctionInfoVO avo) {
		this.avo = avo;
	}

	public DeliveryInfoVO getDvo() {
		return dvo;
	}

	public void setDvo(DeliveryInfoVO dvo) {
		this.dvo = dvo;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public String getSearchVal() {
		return searchVal;
	}

	public void setSearchVal(String searchVal) {
		this.searchVal = searchVal;
	}

	public int getStart_num() {
		return start_num;
	}

	public void setStart_num(int start_num) {
		this.start_num = start_num;
	}

	public int getEnd_num() {
		return end_num;
	}

	public void setEnd_num(int end_num) {
		this.end_num = end_num;
	}

	public int getBid_cnt() {
		return bid_cnt;
	}

	public void setBid_cnt(int bid_cnt) {
		this.bid_cnt = bid_cnt;
	}

	public long getBid_max_money() {
		return bid_max_money;
	}

	public void setBid_max_money(long bid_max_money) {
		this.bid_max_money = bid_max_money;
	}
	
	public long getMoney_first() {
		return money_first;
	}

	public void setMoney_first(long money_first) {
		this.money_first = money_first;
	}

	public long getMoney_pay() {
		return money_pay;
	}

	public void setMoney_pay(long money_pay) {
		this.money_pay = money_pay;
	}
	
	public String getDeli_div_cd() {
		return deli_div_cd;
	}

	public void setDeli_div_cd(String deli_div_cd) {
		this.deli_div_cd = deli_div_cd;
	}
	
	public String getDeli_div_nm() {
		return deli_div_nm;
	}

	public void setDeli_div_nm(String deli_div_nm) {
		this.deli_div_nm = deli_div_nm;
	}	

	public String getFilename_thumb() {
		return filename_thumb;
	}

	public void setFilename_thumb(String filename_thumb) {
		this.filename_thumb = filename_thumb;
	}

	public String getAcutdate_start_str() {
		return acutdate_start_str;
	}

	public void setAcutdate_start_str(String acutdate_start_str) {
		this.acutdate_start_str = acutdate_start_str;
	}

	public String getAcutdate_end_str() {
		return acutdate_end_str;
	}

	public void setAcutdate_end_str(String acutdate_end_str) {
		this.acutdate_end_str = acutdate_end_str;
	}
	
	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public int getMovePage() {
		return movePage;
	}

	public void setMovePage(int movePage) {
		this.movePage = movePage;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	@Override
	public String toString() {
		return "ProductVO ["
				+ "product_cd=" + product_cd + ", product_nm=" + product_nm + ", member_id=" + member_id + ", member_nm=" + member_nm
				+ ", class_big_cd=" + class_big_cd + ", class_big_nm=" + class_big_nm + ", class_mid_cd=" + class_mid_cd
				+ ", class_mid_nm=" + class_mid_nm + ", content=" + content + ", state_cd=" + state_cd 
				+ ", state_nm=" + state_nm + ", regdate=" + regdate + ", moddate=" + moddate + ", deldate=" + deldate 
				+ ", use_yn=" + use_yn + ", viewcnt=" + viewcnt + ", ivo=" + ivo + ", avo=" + avo + ", dvo=" + dvo 
				+ ", rn=" + rn + ", searchVal=" + searchVal + ", start_num=" + start_num + ", end_num=" + end_num 
				+ ", bid_cnt=" + bid_cnt + ", bid_max_money=" + bid_max_money + ", filename_thumb=" + filename_thumb
				+ ", acutdate_start_str=" + acutdate_start_str + ", acutdate_end_str=" + acutdate_end_str
				+ ", money_first=" + money_first + ", money_pay=" + money_pay
				+ ", deli_div_cd=" + deli_div_cd + ", deli_div_nm=" + deli_div_nm
				+ ", startIndex=" + startIndex + ", cntPerPage=" + cntPerPage
				+ ", movePage=" + movePage + ", searchType=" + searchType + ", keyWord=" + keyWord 
				+ "]";
	}
}
