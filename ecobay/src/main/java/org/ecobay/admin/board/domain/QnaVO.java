package org.ecobay.admin.board.domain;

import java.util.Date;
import java.util.List;

public class QnaVO {
	
	private int qna_idx; 
	private String member_id; 
	private String title;
	private String content;
	private Date regDate;
	private List<QnaReplyVO> qnaReplyList;
	
	
	/** 페이징 **/
	private int startIndex;
	private int cntPerPage;

	
	public QnaVO() {
		
	}

	public QnaVO(int qna_idx, String member_id, String title, String content, Date regDate,
			List<QnaReplyVO> qnaReplyList, int startIndex, int cntPerPage) {
		super();
		this.qna_idx = qna_idx;
		this.member_id = member_id;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.qnaReplyList = qnaReplyList;
		this.startIndex = startIndex;
		this.cntPerPage = cntPerPage;
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


	public List<QnaReplyVO> getQnaReplyList() {
		return qnaReplyList;
	}


	public void setQnaReplyList(List<QnaReplyVO> qnaReplyList) {
		this.qnaReplyList = qnaReplyList;
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


	@Override
	public String toString() {
		return "QnaVO [qna_idx=" + qna_idx + ", member_id=" + member_id + ", title=" + title + ", content=" + content
				+ ", regDate=" + regDate + ", qnaReplyList=" + qnaReplyList + ", startIndex=" + startIndex
				+ ", cntPerPage=" + cntPerPage + "]";
	}

	
	

}
