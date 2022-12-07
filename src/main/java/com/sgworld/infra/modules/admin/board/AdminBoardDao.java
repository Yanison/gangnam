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
	
	//공통코드
	public List<AdminBoardDto> ccNameList() { return sqlSession.selectList(namespace + ".ccNameList", ""); }
	
	//관리자 글쓰기
	public int insert(AdminBoardDto dto) { return sqlSession.insert(namespace + ".insert", dto); }
	public int update(AdminBoardDto dto) { return sqlSession.update(namespace + ".update", dto); }
	public int uelete(AdminBoardDto dto) { return sqlSession.update(namespace + ".uelete", dto); }
	public int delete(AdminBoardVo vo) { return sqlSession.delete(namespace + ".delete", vo); }
	
	//관리자 업로드
	public int insertUploaded(AdminBoardDto dto) { return sqlSession.insert("Base" + ".insertUploaded", dto); }
	public int ueleteUploaded(AdminBoardDto dto) { return sqlSession.insert("Base" + ".ueleteUploaded", dto); }
	public int deleteUploaded(AdminBoardDto dto) { return sqlSession.insert("Base" + ".deleteUploaded", dto); }
	
	public List<AdminBoardDto> selectListUploaed(AdminBoardVo vo) { return sqlSession.selectList(namespace + ".selectListUploaded", vo); }
	
	//댓글
	public List<AdminBoardDto> selectCommentList(AdminBoardVo vo) {
		List<AdminBoardDto> list = sqlSession.selectList(namespace + ".selectCommentList", vo);
		return list;
	}
	
	public int selectCommentCount(AdminBoardVo vo) {
		return sqlSession.selectOne(namespace + ".selectCommentCount", vo);
	}
	
	public int commentInst(AdminBoardDto dto) { return sqlSession.insert(namespace + ".commentInst", dto); }
	public int commentDele(AdminBoardVo vo) { return sqlSession.delete(namespace + ".commentDele", vo); }
	
	//조회수
	public int boardViewCount(AdminBoardDto dto) { return sqlSession.update(namespace + ".boardViewCount", dto); }
	
	//좋아요
	public int boardLikeCount(AdminBoardVo vo) { return sqlSession.selectOne(namespace + ".boardLikeCount", vo); }
	public AdminBoardDto boardLiked(AdminBoardVo vo) { return sqlSession.selectOne(namespace + ".boardLiked", vo); }
	public int insertLike(AdminBoardDto dto) { return sqlSession.insert(namespace + ".insertLike", dto); }
	public int deleteLike(AdminBoardVo vo) { return sqlSession.delete(namespace + ".deleteLike", vo); }

	//답글 리스트
	public List<AdminBoardDto>recommentList(AdminBoardVo vo){return sqlSession.selectList(namespace + ".recommentList", vo);}
	
	//답글 쓰기
	public int reComentInst(AdminBoardDto dto) {return sqlSession.insert(namespace +".reComentInst", dto);}
	
	//답글 갯수세기
	public int selectReCommentCount(AdminBoardVo vo) {return sqlSession.selectOne(namespace +".selectReCommentCount", vo);}
}