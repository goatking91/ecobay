package org.ecobay.admin.board.domain;

import java.util.Date;

public class CategoryVO {
	
	private String category_cd;
	private String category_nm;
	private Date regDate;
	
	public CategoryVO() {
		
	}

	public CategoryVO(String category_cd, String category_nm, Date regDate) {
		super();
		this.category_cd = category_cd;
		this.category_nm = category_nm;
		this.regDate = regDate;
	}

	public String getCategory_cd() {
		return category_cd;
	}

	public void setCategory_cd(String category_cd) {
		this.category_cd = category_cd;
	}

	public String getCategory_nm() {
		return category_nm;
	}

	public void setCategory_nm(String category_nm) {
		this.category_nm = category_nm;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "CategoryVO [category_cd=" + category_cd + ", category_nm=" + category_nm + ", regDate=" + regDate + "]";
	}
	
}
