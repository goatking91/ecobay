package org.ecobay.admin.board.domain;

import java.util.Date;

public class QnaReplyVO {
	
	private int qna_idx;
	private int qnarp_idx;
	private String admin_id; 
	private String content;
	private Date regDate;

	
	public QnaReplyVO() {
		
	}


	public QnaReplyVO(int qna_idx, int qnarp_idx, String admin_id, String content, Date regDate) {
		super();
		this.qna_idx = qna_idx;
		this.qnarp_idx = qnarp_idx;
		this.admin_id = admin_id;
		this.content = content;
		this.regDate = regDate;
	}


	public int getQna_idx() {
		return qna_idx;
	}


	public void setQna_idx(int qna_idx) {
		this.qna_idx = qna_idx;
	}


	public int getQnarp_idx() {
		return qnarp_idx;
	}


	public void setQnarp_idx(int qnarp_idx) {
		this.qnarp_idx = qnarp_idx;
	}


	public String getAdmin_id() {
		return admin_id;
	}


	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
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
		return "QnaReplyVO [qna_idx=" + qna_idx + ", qnarp_idx=" + qnarp_idx + ", admin_id=" + admin_id + ", content="
				+ content + ", regDate=" + regDate + "]";
	}

	
	

}
