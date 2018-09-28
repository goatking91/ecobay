package org.ecobay.admin.board.domain;

import java.util.Date;
import java.util.List;

public class NoticeVO {
	private int notice_idx;
	private String title;
	private String content;
	private Date regDate;
	private Date modDate;
	private int viewCNT;
	private boolean use_YN;
	private List<NoticeImageVO> imgVO;
	
	public NoticeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public NoticeVO(int notice_idx, String title, String content, Date regDate, Date modDate, int viewCNT,
			boolean use_YN, List<NoticeImageVO> imgVO) {
		super();
		this.notice_idx = notice_idx;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.modDate = modDate;
		this.viewCNT = viewCNT;
		this.use_YN = use_YN;
		this.imgVO = imgVO;
	}

	public int getNotice_idx() {
		return notice_idx;
	}

	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
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

	public int getViewCNT() {
		return viewCNT;
	}

	public void setViewCNT(int viewCNT) {
		this.viewCNT = viewCNT;
	}

	public boolean isUse_YN() {
		return use_YN;
	}

	public void setUse_YN(boolean use_YN) {
		this.use_YN = use_YN;
	}

	public List<NoticeImageVO> getImgVO() {
		return imgVO;
	}

	public void setImgVO(List<NoticeImageVO> imgVO) {
		this.imgVO = imgVO;
	}

	@Override
	public String toString() {
		return "NoticeVO [notice_idx=" + notice_idx + ", title=" + title + ", content=" + content + ", regDate="
				+ regDate + ", modDate=" + modDate + ", viewCNT=" + viewCNT + ", use_YN=" + use_YN + ", imgVO=" + imgVO
				+ "]";
	}
	
	

}