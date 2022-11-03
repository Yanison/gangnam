package com.sgworld.infra.modules.user.member;

import java.util.Date;

public class MemberDto {
	
	//infrMember
	private String infrMmSeq;
	private Integer infrMmDiv;
	private String infrMmId;
	private String infrMmKakaoIdToken;
	private String infrMmPw;
	private String infrMmName;
	private String infrMmNickName;
	private Date infrMmBod;
	private Integer infrMmGender;
	private Integer infrMmTelecom;
	private String infrMmPhone;
	private String infrMmEmailId;
	private Integer infrMmAddress;
	private String infrMmJibunAddress;
	private String infrMmDetailAddress;
	private String infrMmLat;
	private String infrMmLong;
	private Date regDatetime;

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
	
}
