package org.ecobay.admin.board.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {
	private int notice_idx;
	private String title;
	private String content;
	private Date regDate;
	private Date modDate;
	private int viewCNT;
	private boolean use_YN;
	private List<MultipartFile> upload;
	private List<NoticeFileVO> fileVOList;
	
	/** 페이징 **/
	private int startIndex;
	private int cntPerPage;
	
	/** 검색 **/
	private String searchType;
	private String keyWorld;
	
	public NoticeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public NoticeVO(int notice_idx, String title, String content, Date regDate, Date modDate, int viewCNT,
			boolean use_YN, List<MultipartFile> upload, List<NoticeFileVO> fileVOList, int startIndex, int cntPerPage,
			String searchType, String keyWorld) {
		super();
		this.notice_idx = notice_idx;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.modDate = modDate;
		this.viewCNT = viewCNT;
		this.use_YN = use_YN;
		this.upload = upload;
		this.fileVOList = fileVOList;
		this.startIndex = startIndex;
		this.cntPerPage = cntPerPage;
		this.searchType = searchType;
		this.keyWorld = keyWorld;
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

	public List<MultipartFile> getUpload() {
		return upload;
	}

	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}

	public List<NoticeFileVO> getFileVOList() {
		return fileVOList;
	}

	public void setFileVOList(List<NoticeFileVO> fileVOList) {
		this.fileVOList = fileVOList;
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


	/* addFileList*/
	public void addArticleFile(NoticeFileVO noticeFile) {
		
	      this.fileVOList = new ArrayList<NoticeFileVO>();
	      
	      fileVOList.add(noticeFile);
	}

	
	@Override
	public String toString() {
		return "NoticeVO [notice_idx=" + notice_idx + ", title=" + title + ", content=" + content + ", regDate="
				+ regDate + ", modDate=" + modDate + ", viewCNT=" + viewCNT + ", use_YN=" + use_YN + ", upload="
				+ upload + ", fileVOList=" + fileVOList + ", startIndex=" + startIndex + ", cntPerPage=" + cntPerPage
				+ ", searchType=" + searchType + ", keyWorld=" + keyWorld + "]";
	}


	
	
	
	

}
