package org.ecobay.user.product.domain;

import java.util.Date;

public class BibInfoVO {
	private String product_cd;
	private String member_id; // 입찰자ID
	private long money_bit; // 입찰금액
	private Date regdate;
	
	public BibInfoVO() { 
		
	}
	
	public BibInfoVO(String product_cd, String member_id, long money_bit, Date regdate) {
		this.product_cd = product_cd;
		this.member_id = member_id;
		this.money_bit = money_bit;
		this.regdate = regdate;
	}

	public String getProduct_cd() {
		return product_cd;
	}

	public void setProduct_cd(String product_cd) {
		this.product_cd = product_cd;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public long getMoney_bit() {
		return money_bit;
	}

	public void setMoney_bit(long money_bit) {
		this.money_bit = money_bit;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "BibInfoVO ["
				+ "product_cd=" + product_cd 
				+ ", member_id=" + member_id 
				+ ", money_bit=" + money_bit
				+ ", regdate=" + regdate 
				+ "]";
	}
}
