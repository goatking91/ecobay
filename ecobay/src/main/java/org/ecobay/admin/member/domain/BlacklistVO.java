package org.ecobay.admin.member.domain;

import java.util.Date;

public class BlacklistVO {
	
	private int rn;
	private int idx_cd;
	private String member_id;
	private String member_name;
	private String regcontent;
	private String cancontent;
	private String black_yn;
	private Date regdate;
	private Date candate;
	
	/** 페이징 **/
	private int startIndex;
	private int cntPerPage;
	private int movePage;
	
	/** 검색 **/
	private String searchType;
	private String keyWord;
	
	public BlacklistVO() {
		
	}

	public BlacklistVO(int rn, int idx_cd, String member_id, String member_name, String regcontent, String cancontent,
			String black_yn, Date regdate, Date candate, int startIndex, int cntPerPage, int movePage,
			String searchType, String keyWord) {
		this.rn = rn;
		this.idx_cd = idx_cd;
		this.member_id = member_id;
		this.member_name = member_name;
		this.regcontent = regcontent;
		this.cancontent = cancontent;
		this.black_yn = black_yn;
		this.regdate = regdate;
		this.candate = candate;
		this.startIndex = startIndex;
		this.cntPerPage = cntPerPage;
		this.movePage = movePage;
		this.searchType = searchType;
		this.keyWord = keyWord;
	}
	
	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public int getIdx_cd() {
		return idx_cd;
	}

	public void setIdx_cd(int idx_cd) {
		this.idx_cd = idx_cd;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getRegcontent() {
		return regcontent;
	}

	public void setRegcontent(String regcontent) {
		this.regcontent = regcontent;
	}

	public String getCancontent() {
		return cancontent;
	}

	public void setCancontent(String cancontent) {
		this.cancontent = cancontent;
	}

	public String getBlack_yn() {
		return black_yn;
	}

	public void setBlack_yn(String black_yn) {
		this.black_yn = black_yn;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getCandate() {
		return candate;
	}

	public void setCandate(Date candate) {
		this.candate = candate;
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

	public int getMovePage() {
		return movePage;
	}

	public void setMovePage(int movePage) {
		this.movePage = movePage;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	@Override
	public String toString() {
		return "BlacklistVO [rn=" + rn + ", idx_cd=" + idx_cd + ", member_id=" + member_id + ", member_name="
				+ member_name + ", regcontent=" + regcontent + ", cancontent=" + cancontent + ", black_yn=" + black_yn
				+ ", regdate=" + regdate + ", candate=" + candate + ", startIndex=" + startIndex + ", cntPerPage="
				+ cntPerPage + ", movePage=" + movePage + ", searchType=" + searchType + ", keyWord=" + keyWord + "]";
	}
	
}
