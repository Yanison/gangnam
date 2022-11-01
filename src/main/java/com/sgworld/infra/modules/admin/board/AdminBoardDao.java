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
	
	public List<BoardDto> selectList(BoardVo vo) {
		List<BoardDto> list = sqlSession.selectList(namespace + ".selectList", vo);
		return list;
	}
	
	public int selectOneCount(BoardVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	
	public BoardDto selectOne(BoardVo vo) {
		BoardDto item = sqlSession.selectOne(namespace + ".selectOne", vo);
		return item;
	}
}
