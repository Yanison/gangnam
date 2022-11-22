package com.sgworld.infra.modules.admin.code;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdminCodeDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.sgworld.infra.modules.admin.code.AdminCodeMapper";
	// for cache
	public List<CodeDto> selectListCachedCodeArrayList(){ return sqlSession.selectList(namespace + ".selectListCachedCodeArrayList", null); }
		
	public List<CodeDto>selectList(CodeVo vo){
		return sqlSession.selectList(namespace + ".selectList", vo);
	}
	
	public int selectOneCount(CodeVo vo) {
		return sqlSession.selectOne(namespace +".selectOneCount", vo);
	}
	
	//admin cc등록
	public int insert(CodeDto dto) {
		return sqlSession.insert(namespace +".insert", dto);
	}
	
	//admin ccg리스트 띄우기
	public List<CodeDto>viewList(){
		return sqlSession.selectList(namespace +".viewList", "");
	}
	
	//admin view 띄우기
	public CodeDto selectOne(CodeVo vo) {
		return sqlSession.selectOne(namespace +".selectOne", vo);
	}
	
	//admin 수정
	public int update(CodeDto dto) {
		return sqlSession.update(namespace + ".update", dto);
	}
	
	//admin 부분삭제
	public int uelete(CodeDto dto) {
		return sqlSession.update(namespace + ".uelete", dto);
	}
	
	//admin 완전삭제
	public int delete(CodeVo vo) {
		return sqlSession.delete(namespace +".delete", vo);
	}
}
