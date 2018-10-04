package org.ecobay.user.product.domain;

import java.util.Date;

public class BidInfoVO {
	private String product_cd;
	private String member_id; // 입찰자ID
	private long money_bid; // 입찰금액
	private Date regdate;
	private int rowcnt;
	private int start_num;
	private int end_num;
	
	private long money_bid_max; //최대입찰금액
	private int member_cnt; //입찰수
	
	public BidInfoVO() { 
		
	}
	
	public BidInfoVO(String product_cd, String member_id, long money_bid, Date regdate
			        , int rowcnt, int start_num, int end_num, long money_bid_max, int member_cnt) {
		this.product_cd = product_cd;
		this.member_id = member_id;
		this.money_bid = money_bid;
		this.regdate = regdate;
		this.rowcnt = rowcnt;
		this.start_num = start_num;
		this.end_num = end_num;
		this.money_bid_max = money_bid_max;
		this.member_cnt = member_cnt;
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
	
	public int getRowcnt() {
		return rowcnt;
	}

	public void setRowcnt(int rowcnt) {
		this.rowcnt = rowcnt;
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
	
	public long getMoney_bid_max() {
		return money_bid_max;
	}

	public void setMoney_bid_max(long money_bid_max) {
		this.money_bid_max = money_bid_max;
	}
	
	public int getMember_cnt() {
		return member_cnt;
	}

	public void setMember_cnt(int member_cnt) {
		this.member_cnt = member_cnt;
	}

	@Override
	public String toString() {
		return "BibInfoVO ["
				+ "product_cd=" + product_cd 
				+ ", member_id=" + member_id 
				+ ", money_bid=" + money_bid
				+ ", regdate=" + regdate
				+ ", rowcnt=" + rowcnt
				+ ", start_num=" + start_num
				+ ", end_num=" + end_num
				+ ", money_bid_max=" + money_bid_max
				+ ", member_cnt=" + member_cnt
				+ "]";
	}
}
