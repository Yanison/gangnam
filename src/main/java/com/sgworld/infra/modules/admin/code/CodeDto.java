package com.sgworld.infra.modules.admin.code;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class CodeDto {
	
	private String infrCcSeq;
	private String infrCodeGroupSeq;
	private String infrCcNameKor;
	private String infrCcNameEng;
	private Integer infrCcUseNy;
	private Integer infrCcDelNy;
	private Integer infrCcDelOrder;
	private Date regDatetime;
	private String regBy;
	private Date modDatetime;
	private String modBy;
	
	private String infrCcgSeq;
//////////////////////////////////////////////////////////	
	
	//for cache
	public static List<CodeDto> cachedCodeArrayList = new ArrayList<CodeDto>();
	
	public String getInfrCcSeq() {
		return infrCcSeq;
	}
	public void setInfrCcSeq(String infrCcSeq) {
		this.infrCcSeq = infrCcSeq;
	}
	public String getInfrCodeGroupSeq() {
		return infrCodeGroupSeq;
	}
	public void setInfrCodeGroupSeq(String infrCodeGroupSeq) {
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
	public String getInfrCcgSeq() {
		return infrCcgSeq;
	}
	public void setInfrCcgSeq(String infrCcgSeq) {
		this.infrCcgSeq = infrCcgSeq;
	}
	
}
