package org.ecobay.user.product.domain;

import java.util.Date;

public class AuctionInfoVO {
	
	private String product_cd;
	private long money_first;
	private long money_last;
	private long money_unit;
	private int auctdate_unit;
	private String acutdate_start_str;
	private String acutdate_end_str;
	private Date acutdate_start;
	private Date acutdate_end;
	private boolean baynow_yn;
	private long baynow_money;
	private Date regdate;
	private String bay_member_id;
	private String payment_proc_cd;
	
	public AuctionInfoVO() {

	}

	public AuctionInfoVO(String product_cd, long money_first, long money_last, long money_unit, int auctdate_unit,
			String acutdate_start_str, String acutdate_end_str, Date acutdate_start, Date acutdate_end, 
			boolean baynow_yn, long baynow_money, Date regdate, String bay_member_id, String payment_proc_cd) {
		this.product_cd = product_cd;
		this.money_first = money_first;
		this.money_last = money_last;
		this.money_unit = money_unit;
		this.auctdate_unit = auctdate_unit;
		this.acutdate_start_str = acutdate_start_str;
		this.acutdate_end_str = acutdate_end_str;
		this.acutdate_start = acutdate_start;
		this.acutdate_end = acutdate_end;
		this.baynow_yn = baynow_yn;
		this.baynow_money = baynow_money;
		this.regdate = regdate;
		this.bay_member_id = bay_member_id;
		this.payment_proc_cd = payment_proc_cd;
	}

	public String getProduct_cd() {
		return product_cd;
	}

	public void setProduct_cd(String product_cd) {
		this.product_cd = product_cd;
	}

	public long getMoney_first() {
		return money_first;
	}

	public void setMoney_first(long money_first) {
		this.money_first = money_first;
	}

	public long getMoney_last() {
		return money_last;
	}

	public void setMoney_last(long money_last) {
		this.money_last = money_last;
	}

	public long getMoney_unit() {
		return money_unit;
	}

	public void setMoney_unit(long money_unit) {
		this.money_unit = money_unit;
	}

	public int getAuctdate_unit() {
		return auctdate_unit;
	}

	public void setAuctdate_unit(int auctdate_unit) {
		this.auctdate_unit = auctdate_unit;
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
	
	public Date getAcutdate_start() {
		return acutdate_start;
	}

	public void setAcutdate_start(Date acutdate_start) {
		this.acutdate_start = acutdate_start;
	}

	public Date getAcutdate_end() {
		return acutdate_end;
	}

	public void setAcutdate_end(Date acutdate_end) {
		this.acutdate_end = acutdate_end;
	}

	public boolean isBaynow_yn() {
		return baynow_yn;
	}

	public void setBaynow_yn(boolean baynow_yn) {
		this.baynow_yn = baynow_yn;
	}

	public long getBaynow_money() {
		return baynow_money;
	}

	public void setBaynow_money(long baynow_money) {
		this.baynow_money = baynow_money;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getBay_member_id() {
		return bay_member_id;
	}

	public void setBay_member_id(String bay_member_id) {
		this.bay_member_id = bay_member_id;
	}

	public String getPayment_proc_cd() {
		return payment_proc_cd;
	}

	public void setPayment_proc_cd(String payment_proc_cd) {
		this.payment_proc_cd = payment_proc_cd;
	}

	@Override
	public String toString() {
		return "AuctionInfoVO ["
				+ "product_cd=" + product_cd + ", money_first=" + money_first + ", money_last=" + money_last
				+ ", money_unit=" + money_unit + ", auctdate_unit=" + auctdate_unit
				+ ", acutdate_start_str=" + acutdate_start_str + ", acutdate_end_str=" + acutdate_end_str
				+ ", acutdate_start=" + acutdate_start + ", acutdate_end_date=" + acutdate_end
				+ ", baynow_yn=" + baynow_yn + ", baynow_money=" + baynow_money 
				+ ", regdate=" + regdate + ", bay_member_id=" + bay_member_id + ", payment_proc_cd=" + payment_proc_cd 
				+ "]";
	}
}
