package com.sgworld.infra.modules.admin.membergroup;

import java.util.List;

public interface MemberGroupService {

	//유저 리스트
	public List<MemberGroup> selectMmList(MemberGroup dto) throws Exception;
	
	//admin_내 정보 보기
	public MemberGroup selectMmOne(MemberGroupVo vo) throws Exception;
	
	//회원가입
	public int insertMmSignIn (MemberGroup dto) throws Exception;
	
	//로그인
	public MemberGroup selectUserLogin(MemberGroup dto) throws Exception;
	
	//회원정보 수정
	public int udptMmifo(MemberGroup dto)throws Exception;
}
