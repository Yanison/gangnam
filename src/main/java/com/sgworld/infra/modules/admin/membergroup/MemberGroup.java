package com.sgworld.infra.modules.admin.membergroup;

import java.util.Date;

public class MemberGroup extends MemberGroupVo{
	
	private String infrMmSeq;
	private Integer infrMmDiv;
	private String infrMmId;
	private String infrMmKakaoIdToken;
	private String infrMmPw;
	private String infrMmName;
	private String infrMmNinckName;
	private Date infrMmDod;
	private Integer infrMmGender;
	private String infrMmPhone;
	private String infrMmEmailId;
	private Integer infrMmEmailAddr;
	private String infrMmZip;
	private String infrMmRoadAdress;
	private String infrMmJibunAdress;
	private String infrMmDetailAdress;
	private String infrMmLat;
	private String infrMmLong;
	private Date regDateAt;
	private String regDateBy;
	private Date modDateAt;
	private String modDateBy;
	private Integer infrMmUseNy;
	private Integer infrMmDelNy;
	
	//board
	private String bdSeq;
	private Integer bdDiv;
	private String bdTitle;
	private String bdContent;
	private Date regDatetie;
	private String regBy;
	private Date modDateTime;
	private String modBy;
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
	public String getInfrMmNinckName() {
		return infrMmNinckName;
	}
	public void setInfrMmNinckName(String infrMmNinckName) {
		this.infrMmNinckName = infrMmNinckName;
	}
	public Date getInfrMmDod() {
		return infrMmDod;
	}
	public void setInfrMmDod(Date infrMmDod) {
		this.infrMmDod = infrMmDod;
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
	public String getInfrMmEmailId() {
		return infrMmEmailId;
	}
	public void setInfrMmEmailId(String infrMmEmailId) {
		this.infrMmEmailId = infrMmEmailId;
	}
	public Integer getInfrMmEmailAddr() {
		return infrMmEmailAddr;
	}
	public void setInfrMmEmailAddr(Integer infrMmEmailAddr) {
		this.infrMmEmailAddr = infrMmEmailAddr;
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
	public Date getRegDateAt() {
		return regDateAt;
	}
	public void setRegDateAt(Date regDateAt) {
		this.regDateAt = regDateAt;
	}
	public String getRegDateBy() {
		return regDateBy;
	}
	public void setRegDateBy(String regDateBy) {
		this.regDateBy = regDateBy;
	}
	public Date getModDateAt() {
		return modDateAt;
	}
	public void setModDateAt(Date modDateAt) {
		this.modDateAt = modDateAt;
	}
	public String getModDateBy() {
		return modDateBy;
	}
	public void setModDateBy(String modDateBy) {
		this.modDateBy = modDateBy;
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
	public Date getRegDatetie() {
		return regDatetie;
	}
	public void setRegDatetie(Date regDatetie) {
		this.regDatetie = regDatetie;
	}
	public String getRegBy() {
		return regBy;
	}
	public void setRegBy(String regBy) {
		this.regBy = regBy;
	}
	public Date getModDateTime() {
		return modDateTime;
	}
	public void setModDateTime(Date modDateTime) {
		this.modDateTime = modDateTime;
	}
	public String getModBy() {
		return modBy;
	}
	public void setModBy(String modBy) {
		this.modBy = modBy;
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
