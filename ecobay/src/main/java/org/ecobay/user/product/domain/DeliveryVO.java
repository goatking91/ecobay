package org.ecobay.user.product.domain;

import java.util.Date;

public class DeliveryVO {
	private String product_cd;
	private String product_nm;
	private String deli_nm;
	private String deli_zipcode;
	private String deli_addr1;
	private String deli_addr2;
	private String deli_phonenum;
	private Date regdate;
	
	public DeliveryVO() {
		
	}
	
	public DeliveryVO(String product_cd, String product_nm, String deli_nm, String deli_zipcode, String deli_addr1, String deli_addr2,
			String deli_phonenum, Date regdate) {
		this.product_cd = product_cd;
		this.product_nm = product_nm;
		this.deli_nm = deli_nm;
		this.deli_zipcode = deli_zipcode;
		this.deli_addr1 = deli_addr1;
		this.deli_addr2 = deli_addr2;
		this.deli_phonenum = deli_phonenum;
		this.regdate = regdate;
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

	public String getDeli_nm() {
		return deli_nm;
	}

	public void setDeli_nm(String deli_nm) {
		this.deli_nm = deli_nm;
	}

	public String getDeli_zipcode() {
		return deli_zipcode;
	}

	public void setDeli_zipcode(String deli_zipcode) {
		this.deli_zipcode = deli_zipcode;
	}

	public String getDeli_addr1() {
		return deli_addr1;
	}

	public void setDeli_addr1(String deli_addr1) {
		this.deli_addr1 = deli_addr1;
	}

	public String getDeli_addr2() {
		return deli_addr2;
	}

	public void setDeli_addr2(String deli_addr2) {
		this.deli_addr2 = deli_addr2;
	}

	public String getDeli_phonenum() {
		return deli_phonenum;
	}

	public void setDeli_phonenum(String deli_phonenum) {
		this.deli_phonenum = deli_phonenum;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}


	@Override
	public String toString() {
		return "DeliveryVO ["
				+ "product_cd=" + product_cd + "product_nm=" + product_nm + ", deli_nm=" + deli_nm 
				+ ", deli_zipcode=" + deli_zipcode + ", deli_addr1=" + deli_addr1 + ", deli_addr2=" + deli_addr2 
				+ ", deli_phonenum=" + deli_phonenum
				+ ", regdate=" + regdate 
				+ "]";
	}

	
}
