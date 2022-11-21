package com.sgworld.infra.modules.admin.avatar;

import com.sgworld.infra.common.base.Base;

public class AvatarDto extends Base {
	private String avatarSeq;
	private Integer ifnrMmSeq;
	private Integer sgwSeq;
	private Integer defaultNy;
	
	public String getAvatarSeq() {
		return avatarSeq;
	}
	public void setAvatarSeq(String avatarSeq) {
		this.avatarSeq = avatarSeq;
	}
	public Integer getIfnrMmSeq() {
		return ifnrMmSeq;
	}
	public void setIfnrMmSeq(Integer ifnrMmSeq) {
		this.ifnrMmSeq = ifnrMmSeq;
	}
	public Integer getSgwSeq() {
		return sgwSeq;
	}
	public void setSgwSeq(Integer sgwSeq) {
		this.sgwSeq = sgwSeq;
	}
	public Integer getDefaultNy() {
		return defaultNy;
	}
	public void setDefaultNy(Integer defaultNy) {
		this.defaultNy = defaultNy;
	}
	
	
}
