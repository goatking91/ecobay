package org.ecobay.user.member.domain;

import java.util.Date;

public class MemberVO {
	
	private String member_id;
	private String member_name;
	private String pwd;
	private String birth;
	private String zipcode;
	private String addr1;
	private String addr2;
	private String gender;
	private String phone;
	private String join_YN;
	private String use_YN;
	private Date regDate;
	private Date modDate;
	private Date delDate;
	
	public MemberVO() {
		
	}
	
	public MemberVO(String member_id, String member_name, String pwd, String birth, String zipcode, String addr1,
			String addr2, String gender, String phone, String join_YN, String use_YN, Date regDate, Date modDate,
			Date delDate) {
		super();
		this.member_id = member_id;
		this.member_name = member_name;
		this.pwd = pwd;
		this.birth = birth;
		this.zipcode = zipcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.gender = gender;
		this.phone = phone;
		this.join_YN = join_YN;
		this.use_YN = use_YN;
		this.regDate = regDate;
		this.modDate = modDate;
		this.delDate = delDate;
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
	public String getJoin_YN() {
		return join_YN;
	}
	public void setJoin_YN(String join_YN) {
		this.join_YN = join_YN;
	}
	public String getUse_YN() {
		return use_YN;
	}
	public void setUse_YN(String use_YN) {
		this.use_YN = use_YN;
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
		return "UserDomain [member_id=" + member_id + ", member_name=" + member_name + ", pwd=" + pwd + ", birth="
				+ birth + ", zipcode=" + zipcode + ", addr1=" + addr1 + ", addr2=" + addr2 + ", gender=" + gender
				+ ", phone=" + phone + ", join_YN=" + join_YN + ", use_YN=" + use_YN + ", regDate=" + regDate
				+ ", modDate=" + modDate + ", delDate=" + delDate + "]";
	}
}
