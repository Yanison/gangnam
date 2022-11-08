package com.sgworld.infra.modules.user.sgWorld.sgwdto;

public class SgwDto {
	
	/*
	 * sgwRoom
	 */
	private String sgwTitle;
	private String sgwPw;
	private Integer sgwMmNumber;
	private Integer sgwMap;
	private Integer sgwAvatar;
	
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
	public Integer getSgwAvatar() {
		return sgwAvatar;
	}
	public void setSgwAvatar(Integer sgwAvatar) {
		this.sgwAvatar = sgwAvatar;
	}
	
	// member
	private String inftMmSeq;

	public String getInftMmSeq() {
		return inftMmSeq;
	}
	public void setInftMmSeq(String inftMmSeq) {
		this.inftMmSeq = inftMmSeq;
	}
}
