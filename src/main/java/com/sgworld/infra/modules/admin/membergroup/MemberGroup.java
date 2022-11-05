package com.sgworld.infra.modules.admin.membergroup;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberGroup extends MemberGroupVo{
	
	private String infrMmSeq;
	private Integer infrMmDiv;
	private String infrMmId;
	private String infrMmKakaoIdToken;
	private String infrMmPw;
	private String infrMmName;
	private String infrMmNickname;
	private Date infrMmBod;
	private Integer infrMmGender;
	private String infrMmPhone;
	private Integer infrMmTelecom;
	private String infrMmEmailId;
	private Integer infrMmEmailAddress;
	private String infrMmZip;
	private String infrMmRoadAdress;
	private String infrMmJibunAdress;
	private String infrMmDetailAdress;
	private String infrMmExtraAddress;
	private String infrMmLat;
	private String infrMmLong;
	private Date regDatetime;
	private String regBy;
	private Date modDatetime;
	private String modBy;
	private Integer infrMmUseNy;
	private Integer infrMmDelNy;
	
	//board
	private String bdSeq;
	private Integer bdDiv;
	private String bdTitle;
	private String bdContent;
	private Integer delNy;
		
	//bdLike
	private String bdLikeSeq;
	private Integer likeNy;
	
	public String getInfrMmSeq() {
		return infrMmSeq;
	}
	public void setInfrMmSeq(String infrMmSeq) {
		this.infrMmSeq = infrMmSeq;
	}
	public Integer getInfrMmDiv() {
		return infrMmDiv;
	}
	public void setInfrMmDiv(Integer infrMmDiv) {
		this.infrMmDiv = infrMmDiv;
	}
	public String getInfrMmId() {
		return infrMmId;
	}
	public void setInfrMmId(String infrMmId) {
		this.infrMmId = infrMmId;
	}
	public String getInfrMmKakaoIdToken() {
		return infrMmKakaoIdToken;
	}
	public void setInfrMmKakaoIdToken(String infrMmKakaoIdToken) {
		this.infrMmKakaoIdToken = infrMmKakaoIdToken;
	}
	public String getInfrMmPw() {
		return infrMmPw;
	}
	public void setInfrMmPw(String infrMmPw) {
		this.infrMmPw = infrMmPw;
	}
	public String getInfrMmName() {
		return infrMmName;
	}
	public void setInfrMmName(String infrMmName) {
		this.infrMmName = infrMmName;
	}
	public String getInfrMmNickname() {
		return infrMmNickname;
	}
	public void setInfrMmNickname(String infrMmNickname) {
		this.infrMmNickname = infrMmNickname;
	}
	public Date getInfrMmBod() {
		return infrMmBod;
	}
	public void setInfrMmBod(Date infrMmBod) {
		this.infrMmBod = infrMmBod;
	}
	public Integer getInfrMmGender() {
		return infrMmGender;
	}
	public void setInfrMmGender(Integer infrMmGender) {
		this.infrMmGender = infrMmGender;
	}
	public String getInfrMmPhone() {
		return infrMmPhone;
	}
	public void setInfrMmPhone(String infrMmPhone) {
		this.infrMmPhone = infrMmPhone;
	}
	public Integer getInfrMmTelecom() {
		return infrMmTelecom;
	}
	public void setInfrMmTelecom(Integer infrMmTelecom) {
		this.infrMmTelecom = infrMmTelecom;
	}
	public String getInfrMmEmailId() {
		return infrMmEmailId;
	}
	public void setInfrMmEmailId(String infrMmEmailId) {
		this.infrMmEmailId = infrMmEmailId;
	}
	public Integer getInfrMmEmailAddress() {
		return infrMmEmailAddress;
	}
	public void setInfrMmEmailAddress(Integer infrMmEmailAddress) {
		this.infrMmEmailAddress = infrMmEmailAddress;
	}
	public String getInfrMmZip() {
		return infrMmZip;
	}
	public void setInfrMmZip(String infrMmZip) {
		this.infrMmZip = infrMmZip;
	}
	public String getInfrMmRoadAdress() {
		return infrMmRoadAdress;
	}
	public void setInfrMmRoadAdress(String infrMmRoadAdress) {
		this.infrMmRoadAdress = infrMmRoadAdress;
	}
	public String getInfrMmJibunAdress() {
		return infrMmJibunAdress;
	}
	public void setInfrMmJibunAdress(String infrMmJibunAdress) {
		this.infrMmJibunAdress = infrMmJibunAdress;
	}
	public String getInfrMmDetailAdress() {
		return infrMmDetailAdress;
	}
	public void setInfrMmDetailAdress(String infrMmDetailAdress) {
		this.infrMmDetailAdress = infrMmDetailAdress;
	}
	public String getInfrMmExtraAddress() {
		return infrMmExtraAddress;
	}
	public void setInfrMmExtraAddress(String infrMmExtraAddress) {
		this.infrMmExtraAddress = infrMmExtraAddress;
	}
	public String getInfrMmLat() {
		return infrMmLat;
	}
	public void setInfrMmLat(String infrMmLat) {
		this.infrMmLat = infrMmLat;
	}
	public String getInfrMmLong() {
		return infrMmLong;
	}
	public void setInfrMmLong(String infrMmLong) {
		this.infrMmLong = infrMmLong;
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
	public Integer getInfrMmUseNy() {
		return infrMmUseNy;
	}
	public void setInfrMmUseNy(Integer infrMmUseNy) {
		this.infrMmUseNy = infrMmUseNy;
	}
	public Integer getInfrMmDelNy() {
		return infrMmDelNy;
	}
	public void setInfrMmDelNy(Integer infrMmDelNy) {
		this.infrMmDelNy = infrMmDelNy;
	}
	
	//board get set
	public String getBdSeq() {
		return bdSeq;
	}
	public void setBdSeq(String bdSeq) {
		this.bdSeq = bdSeq;
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
	public Integer getDelNy() {
		return delNy;
	}
	public void setDelNy(Integer delNy) {
		this.delNy = delNy;
	}
	
	
	// bdLike get set
	public String getBdLikeSeq() {
		return bdLikeSeq;
	}
	public void setBdLikeSeq(String bdLikeSeq) {
		this.bdLikeSeq = bdLikeSeq;
	}
	public Integer getLikeNy() {
		return likeNy;
	}
	public void setLikeNy(Integer likeNy) {
		this.likeNy = likeNy;
	}


	
	private String dupleValiObj;
	private String shDupleStr;


	public String getDupleValiObj() {
		return dupleValiObj;
	}
	public void setDupleValiObj(String dupleValiObj) {
		this.dupleValiObj = dupleValiObj;
	}
	public String getShDupleStr() {
		return shDupleStr;
	}
	public void setShDupleStr(String shDupleStr) {
		this.shDupleStr = shDupleStr;
	}
	
}
