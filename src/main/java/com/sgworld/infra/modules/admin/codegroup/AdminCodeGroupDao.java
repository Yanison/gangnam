package com.sgworld.infra.modules.admin.codegroup;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdminCodeGroupDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.sgworld.infra.modules.admin.codeGroup.AdminCodeGroupMapper";
	
	public List<CodeGroupDto> selectList(CodeGroupVo vo) {
		List<CodeGroupDto> list = sqlSession.selectList(namespace + ".selectList", vo);
		return list;
	}
	
	public int selectOneCount(CodeGroupVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	
	public CodeGroupDto selectOne(CodeGroupVo vo) {
		CodeGroupDto item = sqlSession.selectOne(namespace + ".selectOne", vo);
		return item;
	}
	
	//admin ccg등록
	public int insert(CodeGroupDto dto) {
		return sqlSession.insert(namespace + ".insert", dto);
	}
	
	//admin ccg수정
	public int update(CodeGroupDto dto) {
		return sqlSession.update(namespace +".update", dto);
	}
	
	//admin ccg부분삭제
	public int uelete(CodeGroupDto dto) {
		return sqlSession.update(namespace +".uelete", dto);
	}
	
	//admin ccg완전삭제
	public int delete(CodeGroupVo vo) {
		return sqlSession.delete(namespace +".delete", vo);
	}
	
}
