package com.sgworld.infra.modules.admin.board;

import java.util.Date;

public class BoardDto {
	private Integer bdSeq;
	private Integer infrMmSeq;
	private Integer bdDiv;
	private String bdTitle;
	private String bdContent;
	private Date regDatetime;
	private String regBy;
	private Date modDatetime;
	private String modBy;
	
	public Integer getBdSeq() {
		return bdSeq;
	}
	public void setBdSeq(Integer bdSeq) {
		this.bdSeq = bdSeq;
	}
	public Integer getInfrMmSeq() {
		return infrMmSeq;
	}
	public void setInfrMmSeq(Integer infrMmSeq) {
		this.infrMmSeq = infrMmSeq;
	}
	public Integer getBdDiv() {
		return bdDiv;
	}
	public void setBdDiv(Integer bdDiv) {
		this.bdDiv = bdDiv;
	}
	public String getBdTitle() {
		return bdTitle;
	}
	public void setBdTitle(String bdTitle) {
		this.bdTitle = bdTitle;
	}
	public String getBdContent() {
		return bdContent;
	}
	public void setBdContent(String bdContent) {
		this.bdContent = bdContent;
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
	
	
}
