package com.sgworld.infra.modules.user.sgWorld.sgwdto;


import java.sql.Date;

import com.sgworld.infra.modules.user.sgWorld.sgwSocket.SgwWSController;

public class SgwDto {
	
	/*
	 * sgwRoom
	 */
	private String sgwSeq;
	private String sgwTitle;
	private String sgwPw;
	private Integer sgwMmNumber;
	private Integer sgwMap;
	private String sgwLink;
	private Integer sgwAvatar;
	private Integer isHidden;
	private Date regDatetime;
	
	public Date getRegDatetime() {
		return regDatetime;
	}
	public void setRegDatetime(Date regDatetime) {
		this.regDatetime = regDatetime;
	}
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

	// member
	private String infrMmSeq;
	private String infrMmNickname;

	public String getInfrMmSeq() {
		return infrMmSeq;
	}
	public void setInfrMmSeq(String infrMmSeq) {
		this.infrMmSeq = infrMmSeq;
	}
	public String getInfrMmNickname() {
		return infrMmNickname;
	}
	public void setInfrMmNickname(String infrMmNickname) {
		this.infrMmNickname = infrMmNickname;
	}
	
	private Integer webSocketEventSignal;
	
	public Integer getWebSocketEventSignal() {
		return webSocketEventSignal;
	}
	public void setWebSocketEventSignal(Integer webSocketEventSignal)throws Exception {
		System.out.println("@@@@ webSocketEventSignal @@@@");
		this.webSocketEventSignal = webSocketEventSignal;
	}
	
	
	
}
