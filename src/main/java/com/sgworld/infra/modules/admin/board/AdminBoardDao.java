package com.sgworld.infra.modules.admin.board;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdminBoardDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.sgworld.infra.modules.admin.board.AdminBoardMapper";
	
	public List<AdminBoardDto> selectList(AdminBoardVo vo) {
		List<AdminBoardDto> list = sqlSession.selectList(namespace + ".selectList", vo);
		return list;
	}
	
	public int selectOneCount(AdminBoardVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	
	public AdminBoardDto selectOne(AdminBoardVo vo) {
		AdminBoardDto item = sqlSession.selectOne(namespace + ".selectOne", vo);
		return item;
	}
}
