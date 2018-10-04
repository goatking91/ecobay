package org.ecobay.user.product.domain;

import java.util.Date;

public class ProductQnaVO {
	
	private int qna_idx;
	private String qna_div;
	private String product_cd;
	private String member_id;
	private String title;
	private String content;
	private Date regdate;
	
	private int rowcnt;
	private String member_id_bay;
	private String qna_reply;
	
	private int start_num;
	private int end_num;

	public ProductQnaVO() {
	}

	public ProductQnaVO(int qna_idx, String qna_div, String product_cd, String member_id, String title, String content,
						 Date regdate, int rowcnt, String member_id_bay, String qna_reply, int start_num, int end_num) {
		this.qna_idx = qna_idx;
		this.qna_div = qna_div;
		this.product_cd = product_cd;
		this.member_id = member_id;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.rowcnt = rowcnt;
		this.member_id_bay = member_id_bay;
		this.qna_reply = qna_reply;
		this.start_num = start_num;
		this.end_num = end_num;
	}

	public int getQna_idx() {
		return qna_idx;
	}

	public void setQna_idx(int qna_idx) {
		this.qna_idx = qna_idx;
	}

	public String getQna_div() {
		return qna_div;
	}

	public void setQna_div(String qna_div) {
		this.qna_div = qna_div;
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
	
	public String getMember_id_bay() {
		return member_id_bay;
	}
	
	public void setMember_id_bay(String member_id_bay) {
		this.member_id_bay = member_id_bay;
	}

	public String getQna_reply() {
		return qna_reply;
	}

	public void setQna_reply(String qna_reply) {
		this.qna_reply = qna_reply;
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

	@Override
	public String toString() {
		return "ProductQnaVO ["
				+ "qna_idx=" + qna_idx + ", qna_div=" + qna_div + ", product_cd=" + product_cd
				+ ", member_id=" + member_id + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+ ", rowcnt=" + rowcnt + ", member_id_bay=" + member_id_bay + ", qna_reply=" + qna_reply
				+ ", start_num=" + start_num + ", end_num=" + end_num 
				+ "]";
	}
}
