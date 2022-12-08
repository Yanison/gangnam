package com.sgworld.infra.modules.user.home;

import java.sql.Date;

public class HomeDto {
	private String sgwSeq;
	private String sgwTitle;
	private String sgwPw;
	private Integer sgwMmNumber;
	private Integer sgwMap;
	private String sgwLink;
	private Integer sgwAvatar;
	private Integer isHidden;
	private Date regDatetime;
	private String regByMm;
	private int limitNum;
	
	public String getSgwSeq() {
		return sgwSeq;
	}
	public void setSgwSeq(String sgwSeq) {
		this.sgwSeq = sgwSeq;
	}
	public String getSgwTitle() {
		return sgwTitle;
	}
	public void setSgwTitle(String sgwTitle) {
		this.sgwTitle = sgwTitle;
	}
	public String getSgwPw() {
		return sgwPw;
	}
	public void setSgwPw(String sgwPw) {
		this.sgwPw = sgwPw;
	}
	public Integer getSgwMmNumber() {
		return sgwMmNumber;
	}
	public void setSgwMmNumber(Integer sgwMmNumber) {
		this.sgwMmNumber = sgwMmNumber;
	}
	public Integer getSgwMap() {
		return sgwMap;
	}
	public void setSgwMap(Integer sgwMap) {
		this.sgwMap = sgwMap;
	}
	public String getSgwLink() {
		return sgwLink;
	}
	public void setSgwLink(String sgwLink) {
		this.sgwLink = sgwLink;
	}
	public Integer getSgwAvatar() {
		return sgwAvatar;
	}
	public void setSgwAvatar(Integer sgwAvatar) {
		this.sgwAvatar = sgwAvatar;
	}
	public Integer getIsHidden() {
		return isHidden;
	}
	public void setIsHidden(Integer isHidden) {
		this.isHidden = isHidden;
	}
	public Date getRegDatetime() {
		return regDatetime;
	}
	public void setRegDatetime(Date regDatetime) {
		this.regDatetime = regDatetime;
	}
	public String getRegByMm() {
		return regByMm;
	}
	public void setRegByMm(String regByMm) {
		this.regByMm = regByMm;
	}
	public int getLimitNum() {
		return limitNum;
	}
	public void setLimitNum(int limitNum) {
		this.limitNum = limitNum;
	}
	
	
}
