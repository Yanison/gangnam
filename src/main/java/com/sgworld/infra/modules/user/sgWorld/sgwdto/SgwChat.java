package com.sgworld.infra.modules.user.sgWorld.sgwdto;

import java.util.List;

public class SgwChat {
	
	public static List<SgwChat> userList;
	
	private String sgwSeq;
	private String chatMsg;
	private String infrMmSeq;
	private String infrMmNickname;
	private String endPoint;
	private String avatarseq;
	private int x = 497;
	private int y = 375;
	
	
	public String getSgwSeq() {
		return sgwSeq;
	}
	public void setSgwSeq(String sgwSeq) {
		this.sgwSeq = sgwSeq;
	}
	public String getChatMsg() {
		return chatMsg;
	}
	public void setChatMsg(String chatMsg) {
		this.chatMsg = chatMsg;
	}
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
	public String getEndPoint() {
		return endPoint;
	}
	public void setEndPoint(String endPoint) {
		this.endPoint = endPoint;
	}
	public String getAvatarseq() {
		return avatarseq;
	}
	public void setAvatarseq(String avatarseq) {
		this.avatarseq = avatarseq;
	}
	public int getX() {
		return x;
	}
	public void setX(int x) {
		this.x = x;
	}
	public int getY() {
		return y;
	}
	public void setY(int y) {
		this.y = y;
	}




	private final int startX = 1024/2;
	private final int starY = 768/2;
	
	private String userColor;
	String[] colArr = {
			"#5c1e1e",
			"#7b6bb3",
			"#708a94",
			"#3e6941",
			"#096085",
			"#098536",
			"#000000",
			"#008536",
			"#a19fbf",
			"#63144c"
	};
	
	public String getUserColor() {
		int randNum = (int) Math.floor(Math.random() * (10 - 1) + 1);		
		this.userColor =  colArr[randNum];
		
		return userColor;
	}
	public void setUserColor(String userColor) {
		this.userColor = userColor;
	}
	public double getStartX() {
		return startX;
	}
	public double getStarY() {
		return starY;
	}
	
	private String sgwLink;


	public String getSgwLink() {
		return sgwLink;
	}
	public void setSgwLink(String sgwLink) {
		this.sgwLink = sgwLink;
	}
	
	private int usersNum;


	public int getUsersNum() {
		return usersNum;
	}
	public void setUsersNum(int usersNum) {
		this.usersNum = usersNum;
	}
	
	
}
