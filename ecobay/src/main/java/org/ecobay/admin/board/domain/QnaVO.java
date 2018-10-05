package org.ecobay.admin.board.domain;

import java.util.Date;

public class QnaVO {
	
	private int qna_idx; 
	private String member_id; 
	private String title;
	private String content;
	private Date regDate;
	
	public QnaVO() {
		
	}

	public QnaVO(int qna_idx, String member_id, String title, String content, Date regDate) {
		super();
		this.qna_idx = qna_idx;
		this.member_id = member_id;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
	}

	public int getQna_idx() {
		return qna_idx;
	}

	public void setQna_idx(int qna_idx) {
		this.qna_idx = qna_idx;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
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

	@Override
	public String toString() {
		return "QnaVO [qna_idx=" + qna_idx + ", member_id=" + member_id + ", title=" + title + ", content=" + content
				+ ", regDate=" + regDate + "]";
	}
	

}
