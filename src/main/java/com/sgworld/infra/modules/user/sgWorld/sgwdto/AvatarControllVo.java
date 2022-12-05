package com.sgworld.infra.modules.user.sgWorld.sgwdto;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

public class AvatarControllVo {
	
	public static List<SgwDto> userArrList = new ArrayList<SgwDto> ();
	MultiValueMap<String, String> userHsList = new LinkedMultiValueMap<>();
	public static Map<String, String> userMpList;
	public List<SgwDto> getUserArrList() {
		return userArrList;
	}
	public void setUserArrList(SgwDto user) {
		AvatarControllVo.userArrList.add(user);
	}
	public MultiValueMap<String, String> getUserHsList() {
		return userHsList;
	}
	public void setUserHsList(String key,String value) {
		this.userHsList.add(key, value);
	}


	private Integer infrMmSeq;
	private String inftMmNickname;
	
	private double x;
	private double y;
	
	
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	public Integer getInfrMmSeq() {
		return infrMmSeq;
	}
	public void setInfrMmSeq(Integer infrMmSeq) {
		this.infrMmSeq = infrMmSeq;
	}
	public String getInftMmNickname() {
		return inftMmNickname;
	}
	public void setInftMmNickname(String inftMmNickname) {
		this.inftMmNickname = inftMmNickname;
	}
	
	
	
	
	
	

}
