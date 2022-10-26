package com.sgworld.infra.modules.admin.code;

import java.util.Date;

public class CodeDto {
	
	private Integer infrCcSeq;
	private Integer infrCodeGroupSeq;
	private String infrCcNameKor;
	private String infrCcNameEng;
	private Integer infrCcUseNy;
	private Integer infrCcDelNy;
	private Integer infrCcDelOrder;
	private Date regDatetime;
	private String regBy;
	private Date modDatetime;
	private String modBy;
	
	public Integer getInfrCcSeq() {
		return infrCcSeq;
	}
	public void setInfrCcSeq(Integer infrCcSeq) {
		this.infrCcSeq = infrCcSeq;
	}
	public Integer getInfrCodeGroupSeq() {
		return infrCodeGroupSeq;
	}
	public void setInfrCodeGroupSeq(Integer infrCodeGroupSeq) {
		this.infrCodeGroupSeq = infrCodeGroupSeq;
	}
	public String getInfrCcNameKor() {
		return infrCcNameKor;
	}
	public void setInfrCcNameKor(String infrCcNameKor) {
		this.infrCcNameKor = infrCcNameKor;
	}
	public String getInfrCcNameEng() {
		return infrCcNameEng;
	}
	public void setInfrCcNameEng(String infrCcNameEng) {
		this.infrCcNameEng = infrCcNameEng;
	}
	public Integer getInfrCcUseNy() {
		return infrCcUseNy;
	}
	public void setInfrCcUseNy(Integer infrCcUseNy) {
		this.infrCcUseNy = infrCcUseNy;
	}
	public Integer getInfrCcDelNy() {
		return infrCcDelNy;
	}
	public void setInfrCcDelNy(Integer infrCcDelNy) {
		this.infrCcDelNy = infrCcDelNy;
	}
	public Integer getInfrCcDelOrder() {
		return infrCcDelOrder;
	}
	public void setInfrCcDelOrder(Integer infrCcDelOrder) {
		this.infrCcDelOrder = infrCcDelOrder;
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
