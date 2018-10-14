package org.ecobay.admin.board.domain;

import java.util.Date;

public class FaqVO {
	
	private int faq_idx; 
	private String title; 
	private String content;
	private Date regDate;
	private Date modDate;
	private CategoryVO category;
	
	/** 페이징 **/
	private int startIndex;
	private int cntPerPage;
	
	/** 검색 **/
	private String searchType;
	private String keyWorld;
	
	public FaqVO() {
		
	}
	
	public FaqVO(int faq_idx, String title, String content, Date regDate, Date modDate, CategoryVO category,
			int startIndex, int cntPerPage, String searchType, String keyWorld) {
		super();
		this.faq_idx = faq_idx;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.modDate = modDate;
		this.category = category;
		this.startIndex = startIndex;
		this.cntPerPage = cntPerPage;
		this.searchType = searchType;
		this.keyWorld = keyWorld;
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

	public CategoryVO getCategory() {
		return category;
	}

	public void setCategory(CategoryVO category) {
		this.category = category;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyWorld() {
		return keyWorld;
	}

	public void setKeyWorld(String keyWorld) {
		this.keyWorld = keyWorld;
	}

	@Override
	public String toString() {
		return "FaqVO [faq_idx=" + faq_idx + ", title=" + title + ", content=" + content + ", regDate=" + regDate
				+ ", modDate=" + modDate + ", category=" + category + ", startIndex=" + startIndex + ", cntPerPage="
				+ cntPerPage + ", searchType=" + searchType + ", keyWorld=" + keyWorld + "]";
	}
	
	


}
