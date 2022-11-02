package com.sgworld.infra.modules.user.board;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {
	
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;

	private static String namespace = "com.sgworld.infra.modules.user.board.BoardMapper";
	
	public List<Board> selectList(BoardVo vo) {
		List<Board> list = sqlSession.selectList(namespace + ".selectList", vo);
		return list;
	}
	
	public int selectOneCount(BoardVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	
	public Board selectOne(BoardVo vo) {
		Board item = sqlSession.selectOne(namespace + ".selectOne", vo);
		return item;
	}
	
	//글쓰기
	public int insert(Board dto) { return sqlSession.insert(namespace + ".insert", dto); }
	public int update(Board dto) { return sqlSession.update(namespace + ".update", dto); }
	public int uelete(Board dto) { return sqlSession.update(namespace + ".uelete", dto); }
	public int delete(BoardVo vo) { return sqlSession.delete(namespace + ".delete", vo); }
		
	
}
