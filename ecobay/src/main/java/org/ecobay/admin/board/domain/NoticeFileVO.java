package org.ecobay.admin.board.domain;

import java.util.Date;

public class NoticeFileVO {
	
	private int file_cd;
	private int file_idx;
	private int notice_idx;
	private String filename;
	private String filename_org;
	private Date regdate;
	
	public NoticeFileVO() {
	}

	public NoticeFileVO(int file_cd, int file_idx, int notice_idx, String filename, String filename_org, Date regdate) {
		super();
		this.file_cd = file_cd;
		this.file_idx = file_idx;
		this.notice_idx = notice_idx;
		this.filename = filename;
		this.filename_org = filename_org;
		this.regdate = regdate;
	}

	public int getFile_cd() {
		return file_cd;
	}

	public void setFile_cd(int file_cd) {
		this.file_cd = file_cd;
	}

	public int getFile_idx() {
		return file_idx;
	}

	public void setFile_idx(int file_idx) {
		this.file_idx = file_idx;
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
		return "NoticeFileVO [file_cd=" + file_cd + ", file_idx=" + file_idx + ", notice_idx=" + notice_idx + ", filename="
				+ filename + ", filename_org=" + filename_org + ", regdate=" + regdate + "]";
	}
	
	
	
	
}
