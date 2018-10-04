package org.ecobay.user.product.domain;

import java.util.Date;

public class DeliveryVO {
	private String product_cd;
	private String deli_nm;
	private String deli_zipcode;
	private String deli_addr1;
	private String deli_addr2;
	private Date regdate;
	
	public DeliveryVO() {
		
	}

	public DeliveryVO(String product_cd, String deli_nm, String deli_zipcode, String deli_addr1, String deli_addr2,
			Date regdate) {
		this.product_cd = product_cd;
		this.deli_nm = deli_nm;
		this.deli_zipcode = deli_zipcode;
		this.deli_addr1 = deli_addr1;
		this.deli_addr2 = deli_addr2;
		this.regdate = regdate;
	}

	public String getProduct_cd() {
		return product_cd;
	}

	public void setProduct_cd(String product_cd) {
		this.product_cd = product_cd;
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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "DeliveryInfoVO [product_cd=" + product_cd + ", deli_nm=" + deli_nm + ", deli_zipcode="
				+ deli_zipcode + ",deli_addr1=" + deli_addr1 +",deli_addr2" + deli_addr2 + ", regdate=" + regdate + "]";
	}
	
	
	
}
