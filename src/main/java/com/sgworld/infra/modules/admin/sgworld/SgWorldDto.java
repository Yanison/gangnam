package com.sgworld.infra.modules.admin.sgworld;

import java.util.Date;

public class SgWorldDto {
	
	/*
	 * sgWorld 
	 */
	private String sgwSeq;
	private String sgwTitle;
	private String sgwPw;
	private String sgwMmNum;
	private Integer sgwMap;
	private Integer sgwLink;
	private Date regDateTime;
	
	
////////////////////////////////////////////
	
	
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
	public String getSgwMmNum() {
		return sgwMmNum;
	}
	public void setSgwMmNum(String sgwMmNum) {
		this.sgwMmNum = sgwMmNum;
	}
	public Integer getSgwMap() {
		return sgwMap;
	}
	public void setSgwMap(Integer sgwMap) {
		this.sgwMap = sgwMap;
	}
	public Integer getSgwLink() {
		return sgwLink;
	}
	public void setSgwLink(Integer sgwLink) {
		this.sgwLink = sgwLink;
	}
	public Date getRegDateTime() {
		return regDateTime;
	}
	public void setRegDateTime(Date regDateTime) {
		this.regDateTime = regDateTime;
	}
	
	
	
	/*
	 * sgWorldRoom
	 */
	private Integer infrMmSeq;
	
	/*
	 * sgWorldChat
	 */
	private String chatSeq;
	private String sgwChId;
	private String sgwChMsg;
	private Date sgwTS;
	
	public SgWorldDto() {
	}
	
	public SgWorldDto(String sgwChId) {
		this.sgwChId = sgwChId;
	}
	
	public Integer getInfrMmSeq() {
		return infrMmSeq;
	}
	public void setInfrMmSeq(Integer infrMmSeq) {
		this.infrMmSeq = infrMmSeq;
	}
	public String getChatSeq() {
		return chatSeq;
	}
	public void setChatSeq(String chatSeq) {
		this.chatSeq = chatSeq;
	}
	public String getSgwChId() {
		return sgwChId;
	}
	public void setSgwChId(String sgwChId) {
		this.sgwChId = sgwChId;
	}
	public String getSgwChMsg() {
		return sgwChMsg;
	}
	public void setSgwChMsg(String sgwChMsg) {
		this.sgwChMsg = sgwChMsg;
	}
	public Date getSgwTS() {
		return sgwTS;
	}
	public void setSgwTS(Date sgwTS) {
		this.sgwTS = sgwTS;
	}
	
	
	
	/*
	 * sgWorldAvart
	 */
	private Integer avatarSeq;
	private Integer defaultNy;
	public Integer getAvatarSeq() {
		return avatarSeq;
	}
	public void setAvatarSeq(Integer avatarSeq) {
		this.avatarSeq = avatarSeq;
	}
	public Integer getDefaultNy() {
		return defaultNy;
	}
	public void setDefaultNy(Integer defaultNy) {
		this.defaultNy = defaultNy;
	}
	
	
	
}
