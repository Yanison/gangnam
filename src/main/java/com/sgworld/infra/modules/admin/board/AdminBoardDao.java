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
	
	//글쓰기
	public int insert(AdminBoardDto dto) { return sqlSession.insert(namespace + ".insert", dto); }
	public int update(AdminBoardDto dto) { return sqlSession.update(namespace + ".update", dto); }
	public int uelete(AdminBoardDto dto) { return sqlSession.update(namespace + ".uelete", dto); }
	public int delete(AdminBoardVo vo) { return sqlSession.delete(namespace + ".delete", vo); }
	
	//댓글
	public List<AdminBoardDto> selectCommentList(AdminBoardVo vo) {
		List<AdminBoardDto> list = sqlSession.selectList(namespace + ".selectCommentList", vo);
		return list;
	}
}
