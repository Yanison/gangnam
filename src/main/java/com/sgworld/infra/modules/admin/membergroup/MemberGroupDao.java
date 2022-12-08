package com.sgworld.infra.modules.admin.membergroup;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;



@Repository
public class MemberGroupDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	public static String namespace = "com.sgworld.infra.modules.admin.membergroup.MemberGroupMapper";
	
	public List<MemberGroup> selectMmList(MemberGroupVo vo){
		return sqlSession.selectList(namespace + ".selectMmList", vo);
	}
	
	//user_회원정보 보기
	public MemberGroup selectMmOne(MemberGroupVo vo) {
		return sqlSession.selectOne(namespace +".selectMmOne", vo);
	}
	
	//user_회원정보 수정
	public int userUpdate(MemberGroup dto) {
		return sqlSession.update(namespace + ".userUpdate", dto);
	}
	
	public int insertMmSignIn (MemberGroup dto) {
		return sqlSession.insert(namespace + ".insertMmSignIn", dto);
	}
	
	//user_로그인
	public MemberGroup selectUserLogin(MemberGroup dto) {
		return sqlSession.selectOne(namespace + ".selectUserLogin", dto);
	}
	public MemberGroup selectOneXdminId(MemberGroup dto) { return sqlSession.selectOne(namespace + ".selectOneXdminId", dto); }
	public MemberGroup selectOneXdminLogin(MemberGroup dto) { return sqlSession.selectOne(namespace + ".selectOneXdminLogin", dto); }
	
	public int isduple(MemberGroup dto) {
		return sqlSession.selectOne(namespace + ".isduple", dto);
	}
	
	public int udptMmifo(MemberGroup dto) {
		return sqlSession.update(namespace +".udptMmifo", dto);
	}
	
	//user_회원 계시글 리스트 띄우기
	public List<MemberGroup>selectListBoard(MemberGroupVo vo){
		return sqlSession.selectList(namespace + ".selectListBoard", vo);
	}
	
	//user_admin 부분삭제
	public int ueleteMm(MemberGroup dto) {
		return sqlSession.update(namespace + ".ueleteMm", dto);
	}
	
	//admin count조회
	public int selectOneCount(MemberGroupVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	

	public int selectCount(MemberGroupVo vo) {
		return sqlSession.selectOne(namespace +".selectCount", vo);
	}
	
	//admin 회원정보 수정
	public int adminUpdate(MemberGroup dto) {
		return sqlSession.update(namespace + ".adminUpdate", dto);
	}
	
	//admin 회원정보 삭제여부삭제
	public int adminUelete(MemberGroup dto) {
		return sqlSession.update(namespace + ".adminUelete", dto);
	}
	
	//admin 회원정보 완전삭제
	public int adminDelete(MemberGroupVo vo) {
		return sqlSession.delete(namespace + ".adminDelete", vo);
	}
	
	//밑 3개 아바타 자기 사진 올리기,업데이트,수정
	public int insertUploaded(MemberGroup dto) {
		return sqlSession.insert("Base" + ".insertUploaded", dto); 
	}
	
	public int ueleteUploaded(MemberGroup dto) { 
		return sqlSession.insert("Base" + ".ueleteUploaded", dto); 
	}
	
	public int deleteUploaded(MemberGroup dto) {
		return sqlSession.insert("Base" + ".deleteUploaded", dto); 
	}
	
	public MemberGroup selectCheck(MemberGroupVo vo) {
		return sqlSession.selectOne(namespace +".selectCheck", vo);
	}
	
	public List<MemberGroup>selectListUploaded(MemberGroupVo vo){
		return sqlSession.selectList(namespace +".selectListUploaded", vo);
	}
	
	//user_마이페이지 정보 가져오기
	public MemberGroup selectMember(MemberGroupVo vo){
		return sqlSession.selectOne(namespace +".selectMember", vo);
	}
	
	
}
