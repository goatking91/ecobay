package org.ecobay.user.product.domain;

import java.util.Date;
import java.util.List;

public class ProdSearchVO {
	private String page;
	private String searchVal; // 검색어
	private String class_big_cd;
	private String class_mid_cd;

	
	public ProdSearchVO() {
	}

	public ProdSearchVO(String page, String searchVal, String class_big_cd, String class_mid_cd) {
		this.page = page;
		this.searchVal = searchVal;
		this.class_big_cd = class_big_cd;
		this.class_mid_cd = class_mid_cd;
	}


	public String getClass_big_cd() {
		return class_big_cd;
	}

	public void setClass_big_cd(String class_big_cd) {
		this.class_big_cd = class_big_cd;
	}

	public String getClass_mid_cd() {
		return class_mid_cd;
	}

	public void setClass_mid_cd(String class_mid_cd) {
		this.class_mid_cd = class_mid_cd;
	}

	public String getSearchVal() {
		return searchVal;
	}

	public void setSearchVal(String searchVal) {
		this.searchVal = searchVal;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	@Override
	public String toString() {
		return "ProdSearchVO ["
				+ "page=" + page + ", searchVal=" + searchVal + ", class_big_cd=" + class_big_cd
				+ ", class_mid_cd=" + class_mid_cd 
				+ "]";
	}
	

	
}
