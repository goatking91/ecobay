package org.ecobay.user.member.domain;

import java.util.Date;
import java.util.List;

public class MemberProductVO {
	// ==== PRODUCT(상품테이블) ==== //
	private String product_cd;
	private String product_nm;
	private String member_id;
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
	private String payment_proc_cd;

	private String deli_div_cd; // 배송구분 - 구매상품(배송정보)

	private int rn;
	private String searchVal; // 검색어
	
	private String filename_thumb; // 썸네일파일명
	private String acutdate_start_str; // 경매시작일시(String)
	private String acutdate_end_str; // 경매종료일시(String)
	
	private int start, end, page, startpage, endpage, pagecount, temp;
/*	private String pnum, returnpage;*/
	
	public MemberProductVO() { 
		
	}


	public MemberProductVO(String product_cd, String product_nm, String member_id, String class_big_cd,
			String class_big_nm, String class_mid_cd, String class_mid_nm, String content, String state_cd,
			String state_nm, Date regdate, Date moddate, Date deldate, Boolean use_yn, int viewcnt,
			String payment_proc_cd, int rn, String searchVal, String filename_thumb, String acutdate_start_str,
			String acutdate_end_str, int start, int end, int page, int startpage, int endpage, int pagecount,
			int temp, String deli_div_cd) {
		super();
		this.product_cd = product_cd;
		this.product_nm = product_nm;
		this.member_id = member_id;
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
		this.payment_proc_cd = payment_proc_cd;
		this.rn = rn;
		this.searchVal = searchVal;
		this.filename_thumb = filename_thumb;
		this.acutdate_start_str = acutdate_start_str;
		this.acutdate_end_str = acutdate_end_str;
		this.start = start;
		this.end = end;
		this.page = page;
		this.startpage = startpage;
		this.endpage = endpage;
		this.pagecount = pagecount;
		this.temp = temp;
		this.deli_div_cd = deli_div_cd;
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

	public String getPayment_proc_cd() {
		return payment_proc_cd;
	}

	public void setPayment_proc_cd(String payment_proc_cd) {
		this.payment_proc_cd = payment_proc_cd;
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

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getStartpage() {
		return startpage;
	}

	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}

	public int getEndpage() {
		return endpage;
	}

	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}

	public int getPagecount() {
		return pagecount;
	}

	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}

	public int getTemp() {
		return temp;
	}

	public void setTemp(int temp) {
		this.temp = temp;
	}
	
	public String getDeli_div_cd() {
		return deli_div_cd;
	}

	public void setDeli_div_cd(String deli_div_cd) {
		this.deli_div_cd = deli_div_cd;
	}

	@Override
	public String toString() {
		return "MemberProductVO ["
				+ "product_cd=" + product_cd + ", product_nm=" + product_nm + ", member_id=" + member_id
				+ ", class_big_cd=" + class_big_cd + ", class_big_nm=" + class_big_nm + ", class_mid_cd=" + class_mid_cd
				+ ", class_mid_nm=" + class_mid_nm + ", content=" + content + ", state_cd=" + state_cd 
				+ ", state_nm=" + state_nm + ", regdate=" + regdate + ", moddate=" + moddate + ", deldate=" + deldate 
				+ ", use_yn=" + use_yn + ", viewcnt=" + viewcnt + ", payment_proc_cd=" + payment_proc_cd + ", rn=" + rn
				+ ", searchVal=" + searchVal + ", filename_thumb=" + filename_thumb 
				+ ", acutdate_start_str=" + acutdate_start_str + ", acutdate_end_str=" + acutdate_end_str 
				+ ", start=" + start + ", end=" + end + ", page=" + page + ", startpage=" + startpage 
				+ ", endpage=" + endpage + ", pagecount=" + pagecount + ", temp=" + temp 
				+ ", deli_div_cd=" + deli_div_cd
				+ "]";
	}



	

	

	
}