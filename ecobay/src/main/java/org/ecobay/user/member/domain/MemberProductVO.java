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
	

	private int rn;
	private String searchVal; // 검색어

	// 상품리스트 검색용.
	private int start_num;
	private int end_num;
	
	private String filename_thumb; // 썸네일파일명
	private String acutdate_start_str; // 경매시작일시(String)
	private String acutdate_end_str; // 경매종료일시(String)
	
	private int start, end, page, startpage, endpage, pagecount, temp, total;
/*	private String pnum, returnpage;*/
	
	public MemberProductVO() { 
		
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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
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

	public MemberProductVO(String product_cd, String product_nm, String member_id, String class_big_cd,
			String class_big_nm, String class_mid_cd, String class_mid_nm, String content, String state_cd,
			String state_nm, Date regdate, Date moddate, Date deldate, Boolean use_yn, int viewcnt, int rn,
			String searchVal, int start_num, int end_num, String filename_thumb, String acutdate_start_str,
			String acutdate_end_str, int start, int end, int page, int startpage, int endpage, int pagecount,
			int temp, int total) {
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
		this.rn = rn;
		this.searchVal = searchVal;
		this.start_num = start_num;
		this.end_num = end_num;
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
		this.total = total;
	}

	@Override
	public String toString() {
		return "MemberProductVO [product_cd=" + product_cd + ", product_nm=" + product_nm + ", member_id=" + member_id
				+ ", class_big_cd=" + class_big_cd + ", class_big_nm=" + class_big_nm + ", class_mid_cd=" + class_mid_cd
				+ ", class_mid_nm=" + class_mid_nm + ", content=" + content + ", state_cd=" + state_cd + ", state_nm="
				+ state_nm + ", regdate=" + regdate + ", moddate=" + moddate + ", deldate=" + deldate + ", use_yn="
				+ use_yn + ", viewcnt=" + viewcnt + ", rn=" + rn + ", searchVal=" + searchVal + ", start_num="
				+ start_num + ", end_num=" + end_num + ", filename_thumb=" + filename_thumb + ", acutdate_start_str="
				+ acutdate_start_str + ", acutdate_end_str=" + acutdate_end_str + ", start=" + start + ", end=" + end
				+ ", page=" + page + ", startpage=" + startpage + ", endpage=" + endpage + ", pagecount="
				+ pagecount + ", temp=" + temp + ", total=" + total 
				+ "]";
	}

	

	
}