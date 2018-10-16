package org.ecobay.user.member.domain;

import java.util.Date;

public class MemberQnaVO {
	
	private String member_id;
	private String qna_idx;
	private String title;
	private String content;
	private Date regdate;
	private String regdate_str;
	private String admin_id;
	private String replycontent;
	private String replyregdate;
	
	private int rn;
	private int start, end, page, startpage, endpage, pagecount, temp;
	
	public MemberQnaVO() {
	}


	public MemberQnaVO(String member_id, String qna_idx, String title, String content, Date regdate, String regdate_str,
			String admin_id, String replycontent, String replyregdate, int rn, int start, int end, int page,
			int startpage, int endpage, int pagecount, int temp) {
		super();
		this.member_id = member_id;
		this.qna_idx = qna_idx;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.regdate_str = regdate_str;
		this.admin_id = admin_id;
		this.replycontent = replycontent;
		this.replyregdate = replyregdate;
		this.rn = rn;
		this.start = start;
		this.end = end;
		this.page = page;
		this.startpage = startpage;
		this.endpage = endpage;
		this.pagecount = pagecount;
		this.temp = temp;
	}


	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getQna_idx() {
		return qna_idx;
	}

	public void setQna_idx(String qna_idx) {
		this.qna_idx = qna_idx;
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

	public String getRegdate_str() {
		return regdate_str;
	}

	public void setRegdate_str(String regdate_str) {
		this.regdate_str = regdate_str;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getReplycontent() {
		return replycontent;
	}

	public void setReplycontent(String replycontent) {
		this.replycontent = replycontent;
	}

	public String getReplyregdate() {
		return replyregdate;
	}

	public void setReplyregdate(String replyregdate) {
		this.replyregdate = replyregdate;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getStartpage() {
		return startpage;
	}

	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}

	public int getEndpage() {
		return endpage;
	}

	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}

	public int getPagecount() {
		return pagecount;
	}


	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}






	public int getTemp() {
		return temp;
	}



	public void setTemp(int temp) {
		this.temp = temp;
	}



	@Override
	public String toString() {
		return "MemberQnaVO [member_id=" + member_id + ", qna_idx=" + qna_idx + ", title=" + title + ", content="
				+ content + ", regdate=" + regdate + ", regdate_str=" + regdate_str + ", admin_id=" + admin_id
				+ ", replycontent=" + replycontent + ", replyregdate=" + replyregdate + ", rn=" + rn + ", start="
				+ start + ", end=" + end + ", page=" + page + ", startpage=" + startpage + ", endpage=" + endpage
				+ ", pagecount=" + pagecount + ", temp=" + temp + "]";
	}
	
}