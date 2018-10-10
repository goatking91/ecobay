package org.ecobay.user.member.domain;

import java.util.Date;

public class MemberVO {
	
	private int rn;
	private String member_id;
	private String member_name;
	private String pwd;
	private String birth;
	private String zipcode;
	private String addr1;
	private String addr2;
	private String gender;
	private String phone;
	private boolean join_yn;
	private boolean use_yn;
	private Date regDate;
	private Date modDate;
	private Date delDate;
	
	
	public MemberVO() {
		
	}
	
	
	

	public MemberVO(int rn, String member_id, String member_name, String pwd, String birth, String zipcode,
			String addr1, String addr2, String gender, String phone, boolean join_yn, boolean use_yn, Date regDate,
			Date modDate, Date delDate) {
		super();
		this.rn = rn;
		this.member_id = member_id;
		this.member_name = member_name;
		this.pwd = pwd;
		this.birth = birth;
		this.zipcode = zipcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.gender = gender;
		this.phone = phone;
		this.join_yn = join_yn;
		this.use_yn = use_yn;
		this.regDate = regDate;
		this.modDate = modDate;
		this.delDate = delDate;
	}


	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
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
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public boolean getjoin_yn() {
		return join_yn;
	}
	public void setjoin_yn(boolean join_yn) {
		this.join_yn = join_yn;
	}
	public boolean getuse_yn() {
		return use_yn;
	}
	public void setuse_yn(boolean use_yn) {
		this.use_yn = use_yn;
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
	public Date getDelDate() {
		return delDate;
	}
	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}

	@Override
	public String toString() {
		return "MemberVO [rn=" + rn + ", member_id=" + member_id + ", member_name=" + member_name + ", pwd=" + pwd
				+ ", birth=" + birth + ", zipcode=" + zipcode + ", addr1=" + addr1 + ", addr2=" + addr2 + ", gender="
				+ gender + ", phone=" + phone + ", join_yn=" + join_yn + ", use_yn=" + use_yn + ", regDate=" + regDate
				+ ", modDate=" + modDate + ", delDate=" + delDate + "]";
	}



}
