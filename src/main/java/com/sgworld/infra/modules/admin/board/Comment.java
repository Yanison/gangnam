package com.sgworld.infra.modules.admin.board;

import java.util.Date;

public class Comment {
	/*
	 * beComment
	 */
	private Integer cmSeq;
	private String content;
	private Date regDatetime;
	private String regBy;
	private Date modDatetime;
	private String modBy;
	private Integer bdSeq;
	private Integer infrMmSeq;
	
	public Integer getCmSeq() {
		return cmSeq;
	}
	public void setCmSeq(Integer cmSeq) {
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
	public Integer getBdSeq() {
		return bdSeq;
	}
	public void setBdSeq(Integer bdSeq) {
		this.bdSeq = bdSeq;
	}
	public Integer getInfrMmSeq() {
		return infrMmSeq;
	}
	public void setInfrMmSeq(Integer ifnrMmSeq) {
		this.infrMmSeq = ifnrMmSeq;
	}
	
	/*
	 * beREcoment
	 */
	
}
