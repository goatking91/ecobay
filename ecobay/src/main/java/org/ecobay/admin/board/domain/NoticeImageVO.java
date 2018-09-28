package org.ecobay.admin.board.domain;

import java.util.Date;

public class NoticeImageVO {
	
	private int img_cd;
	private int img_idx;
	private int notice_idx;
	private String filename;
	private String filename_org;
	private Date regdate;
	
	public NoticeImageVO() {
	}

	public NoticeImageVO(int img_cd, int img_idx, int notice_idx, String filename, String filename_org, Date regdate) {
		super();
		this.img_cd = img_cd;
		this.img_idx = img_idx;
		this.notice_idx = notice_idx;
		this.filename = filename;
		this.filename_org = filename_org;
		this.regdate = regdate;
	}

	public int getImg_cd() {
		return img_cd;
	}

	public void setImg_cd(int img_cd) {
		this.img_cd = img_cd;
	}

	public int getImg_idx() {
		return img_idx;
	}

	public void setImg_idx(int img_idx) {
		this.img_idx = img_idx;
	}

	public int getNotice_idx() {
		return notice_idx;
	}

	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFilename_org() {
		return filename_org;
	}

	public void setFilename_org(String filename_org) {
		this.filename_org = filename_org;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "NoticeImageVO [img_cd=" + img_cd + ", img_idx=" + img_idx + ", notice_idx=" + notice_idx + ", filename="
				+ filename + ", filename_org=" + filename_org + ", regdate=" + regdate + "]";
	}
	
	
	
	
}
