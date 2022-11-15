package com.sgworld.infra.modules.admin.membergroup;

import com.sgworld.infra.common.base.BaseVo;

public class MemberGroupVo extends BaseVo{
	private String shValue;
	private Integer shDelNy;
	private Integer shOption;
	private String infrMmSeq;
	
	public String getShValue() {
		return shValue;
	}
	public void setShValue(String shValue) {
		this.shValue = shValue;
	}
	public Integer getShOption() {
		return shOption;
	}
	public void setShOption(Integer shOption) {
		this.shOption = shOption;
	}
	public String getInfrMmSeq() {
		return infrMmSeq;
	}
	public void setInfrMmSeq(String infrMmSeq) {
		this.infrMmSeq = infrMmSeq;
	}
	
	
	public Integer getShDelNy() {
		return shDelNy;
	}
	public void setShDelNy(Integer shDelNy) {
		this.shDelNy = shDelNy;
	}


	private String mmSsSeq;

	public String getMmSsSeq() {
		return mmSsSeq;
	}
	public void setMmSsSeq(String mmSsSeq) {
		this.mmSsSeq = mmSsSeq;
	}
	
	
	
	
	
}
