package org.ecobay.user.product.domain;

import java.util.Date;

public class PaymentVO {
	private String product_cd;
	private long money_pay;
	private Date regdate;
	
	public PaymentVO() {
		
	}
	

	public PaymentVO(String product_cd, int money_pay, Date regdate) {
		this.product_cd = product_cd;
		this.money_pay = money_pay;
		this.regdate = regdate;
	}


	public String getProduct_cd() {
		return product_cd;
	}

	public void setProduct_cd(String product_cd) {
		this.product_cd = product_cd;
	}

	public long getMoney_pay() {
		return money_pay;
	}

	public void setMoney_pay(long money_pay) {
		this.money_pay = money_pay;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}


	@Override
	public String toString() {
		return "PaymentVO [product_cd=" + product_cd + ", money_pay=" + money_pay + "regdate=" + regdate + "]";
	}
	
	
	
}
