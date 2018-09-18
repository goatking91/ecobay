package org.ecobay.user.product.domain;

import java.util.Date;

public class ProductImageVO {
	
	private int img_cd;
	private int img_idx;
	private String product_cd;
	private String filename;
	private String filename_thumb;
	private String filename_org;
	private Date regdate;
	
	public ProductImageVO() {
	}
	
	public ProductImageVO(int img_cd, int img_idx, String product_cd, String filename, String filename_thumb,
			String filename_org, Date regdate) {
		this.img_cd = img_cd;
		this.img_idx = img_idx;
		this.product_cd = product_cd;
		this.filename = filename;
		this.filename_thumb = filename_thumb;
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
	public String getProduct_cd() {
		return product_cd;
	}
	public void setProduct_cd(String product_cd) {
		this.product_cd = product_cd;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilename_thumb() {
		return filename_thumb;
	}
	public void setFilename_thumb(String filename_thumb) {
		this.filename_thumb = filename_thumb;
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
		return "ProductImageVO [img_cd=" + img_cd + ", img_idx=" + img_idx + ", product_cd=" + product_cd
				+ ", filename=" + filename + ", filename_thumb=" + filename_thumb + ", filename_org=" + filename_org
				+ ", regdate=" + regdate + "]";
	}
	
	
	
}
