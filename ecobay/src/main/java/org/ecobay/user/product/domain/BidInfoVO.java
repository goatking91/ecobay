package org.ecobay.user.product.domain;

import java.util.Date;

public class BidInfoVO {
	private String product_cd;
	private String member_id; // 입찰자ID
	private long money_bid; // 입찰금액
	private Date regdate;
	
	public BidInfoVO() { 
		
	}
	
	public BidInfoVO(String product_cd, String member_id, long money_bid, Date regdate) {
		this.product_cd = product_cd;
		this.member_id = member_id;
		this.money_bid = money_bid;
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

	public long getMoney_bid() {
		return money_bid;
	}

	public void setMoney_bid(long money_bid) {
		this.money_bid = money_bid;
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
				+ ", money_bid=" + money_bid
				+ ", regdate=" + regdate 
				+ "]";
	}
}
