package com.sgworld.infra.modules.admin.board;

import java.util.Date;

public class AdminComment {
	/*
	 * beComment
	 */
	private String cmSeq;
	private String content;
	private Date regDatetime;
	private String regBy;
	private Date modDatetime;
	private String modBy;
	private String board_seq;
	private String infrMmSeq;
	
	private String infrMmNickname;
	private String bdSeq;
///////////////////////////////////////////////	
	public String getCmSeq() {
		return cmSeq;
	}
	public void setCmSeq(String cmSeq) {
		this.cmSeq = cmSeq;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDatetime() {
		return regDatetime;
	}
	public void setRegDatetime(Date regDatetime) {
		this.regDatetime = regDatetime;
	}
	public String getRegBy() {
		return regBy;
	}
	public void setRegBy(String regBy) {
		this.regBy = regBy;
	}
	public Date getModDatetime() {
		return modDatetime;
	}
	public void setModDatetime(Date modDatetime) {
		this.modDatetime = modDatetime;
	}
	public String getModBy() {
		return modBy;
	}
	public void setModBy(String modBy) {
		this.modBy = modBy;
	}
	public String getBdSeq() {
		return bdSeq;
	}
	public void setBdSeq(String bdSeq) {
		this.bdSeq = bdSeq;
	}
	public String getInfrMmSeq() {
		return infrMmSeq;
	}
	public void setInfrMmSeq(String ifnrMmSeq) {
		this.infrMmSeq = ifnrMmSeq;
	}
	public String getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(String board_seq) {
		this.board_seq = board_seq;
	}
	public String getInfrMmNickname() {
		return infrMmNickname;
	}
	public void setInfrMmNickname(String infrMmNickname) {
		this.infrMmNickname = infrMmNickname;
	}
	
	/*
	 * beREcoment
	 */
	
}
