package org.ecobay.user.product.domain;

import java.util.Date;

public class DeliveryInfoVO {
	private String product_cd;
	private String deli_div_cd;
	private String deli_div_nm;
	private Date regdate;
	
	public DeliveryInfoVO() {
		
	}

	public DeliveryInfoVO(String product_cd, String deli_div_cd, String deli_div_nm, Date regdate) {
		this.product_cd = product_cd;
		this.deli_div_cd = deli_div_cd;
		this.deli_div_nm = deli_div_nm;
		this.regdate = regdate;
	}

	public String getProduct_cd() {
		return product_cd;
	}

	public void setProduct_cd(String product_cd) {
		this.product_cd = product_cd;
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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "DeliveryInfoVO [product_cd=" + product_cd + ", deli_div_cd=" + deli_div_cd + ", deli_div_nm="
				+ deli_div_nm + ", regdate=" + regdate + "]";
	}
	
	
	
}
