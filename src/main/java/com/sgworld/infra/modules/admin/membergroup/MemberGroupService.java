package com.sgworld.infra.modules.admin.membergroup;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;






public interface MemberGroupService {

	//유저 리스트
	public List<MemberGroup> selectMmList(MemberGroupVo vo) throws Exception;

	//admin_내 정보 보기
	public MemberGroup selectMmOne(MemberGroupVo vo) throws Exception;
	
	//user_내 정보 수정
	public int userUpdate(MemberGroup dto)throws Exception;

	//회원가입
	public int insertMmSignIn (MemberGroup dto) throws Exception;

	//로그인
	public MemberGroup selectUserLogin(MemberGroup dto) throws Exception;
	public MemberGroup selectOneXdminId(MemberGroup dto) throws Exception;
	public MemberGroup selectOneXdminLogin(MemberGroup dto) throws Exception;

	public int udptMmifo(MemberGroup dto)throws Exception;

	//중복확인
	public int isduple(MemberGroup dto) throws Exception;
	
	//user_계시판 리스트 띄우기
	public List<MemberGroup>selectListBoard(MemberGroupVo vo)throws Exception;
	
	//user_admin 부분삭제
	public int ueleteMm(MemberGroup dto)throws Exception;
	
	//admin count조회
	public int selectOneCount(MemberGroupVo vo)throws Exception;
	

	public int selectCount(MemberGroupVo vo)throws Exception;

	//admin 회원정보 수정
	public int adminUpdate(MemberGroup dto)throws Exception;
	
	//admin 회원정보 삭제여부 삭제
	public int adminUelete(MemberGroup dto)throws Exception;
	
	//admin 회원정보 완전 삭제
	public int adminDelete(MemberGroupVo vo)throws Exception;
	
	public void setRegMod(MemberGroup dto) throws Exception;
	public void uploadFiles(MultipartFile[] multipartFiles, MemberGroup dto, String tableName, int type, int maxNumber) throws Exception;
	public void deleteFiles(String[] deleteSeq, String[] deletePathFile, MemberGroup dto, String tableName) throws Exception;
	public void ueleteFiles(String[] deleteSeq, String[] deletePathFile, MemberGroup dto, String tableName) throws Exception;	
	
	public MemberGroup selectCheck(MemberGroupVo vo)throws Exception;
	
	List<MemberGroup>selectListUploaded(MemberGroupVo vo)throws Exception;
	
	//user 마이페이지 정보 보여주기
	public MemberGroup selectMember(MemberGroupVo vo)throws Exception;

}
