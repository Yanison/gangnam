package com.sgworld.infra.modules.user.sgWorld.sgwdto;

public class SgwDto {
	
	/*
	 * sgwRoom
	 */
	private String sgwSeq;
	private String sgwTitle;
	private String sgwPw;
	private Integer sgwMmNumber;
	private Integer sgwMap;
	private Integer sgwAvatar;
	private Integer isHidden;
	
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

	// member
	private String inftMmSeq;
	private String inftMmNickname;

	public String getInftMmSeq() {
		return inftMmSeq;
	}
	public void setInftMmSeq(String inftMmSeq) {
		this.inftMmSeq = inftMmSeq;
	}
	public String getInftMmNickname() {
		return inftMmNickname;
	}
	public void setInftMmNickname(String inftMmNickname) {
		this.inftMmNickname = inftMmNickname;
	}
	
}
