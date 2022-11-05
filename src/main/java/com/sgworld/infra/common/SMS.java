package com.sgworld.infra.common;

import org.jetbrains.annotations.NotNull;

public class SMS {
	
	private String fromNum;
	private String toNum;
	private String msgText;
	public String getFromNum() {
		return fromNum;
	}
	public void setFromNum(String fromNum) {
		this.fromNum = fromNum;
	}
	public String getToNum() {
		return toNum;
	}
	public void setToNum(String toNum) {
		this.toNum = toNum;
	}
	public String getMsgText() {
		return msgText;
	}
	public void setMsgText(String msgText) {
		this.msgText = msgText;
	}
	
	
	private String infrMmEmail;
	public String getInfrMmEmail() {
		return infrMmEmail;
	}
	public void setInfrMmEmail(String infrMmEmail) {
		this.infrMmEmail = infrMmEmail;
	}
	
	

}
