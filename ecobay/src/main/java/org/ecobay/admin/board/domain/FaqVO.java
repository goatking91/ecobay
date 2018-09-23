package org.ecobay.admin.board.domain;

import java.util.Date;

public class FaqVO {
	
	private int faq_idx; 
	private String title; 
	private String content;
	private Date regDate;
	private Date modDate;
	
	public FaqVO() {
		
	}

	public FaqVO(int faq_idx, String title, String content, Date regDate, Date modDate) {
		super();
		this.faq_idx = faq_idx;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.modDate = modDate;
	}

	public int getFaq_idx() {
		return faq_idx;
	}

	public void setFaq_idx(int faq_idx) {
		this.faq_idx = faq_idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getModDate() {
		return modDate;
	}

	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}

	@Override
	public String toString() {
		return "FaqVO [faq_idx=" + faq_idx + ", title=" + title + ", content=" + content + ", regDate=" + regDate
				+ ", modDate=" + modDate + "]";
	}
	
	


}
