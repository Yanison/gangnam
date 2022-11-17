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
	public MemberGroup selectOneId(MemberGroup dto) { return sqlSession.selectOne(namespace + ".selectOneId", dto); }
	public MemberGroup selectOneLogin(MemberGroup dto) { return sqlSession.selectOne(namespace + ".selectOneLogin", dto); }
	
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
	
	
}
