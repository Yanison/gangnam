package com.sgworld.infra.modules.user.board;

import java.util.List;

public interface BoardService {
	
	public List<Board> selectList(BoardVo vo) throws Exception;
	public int selectOneCount(BoardVo vo) throws Exception;
	public Board selectOne(BoardVo vo) throws Exception;
	
	//글쓰기
	public int insert(Board dto) throws Exception;
	public int update(Board dto) throws Exception;
	public int uelete(Board dto) throws Exception;
	public int delete(BoardVo vo) throws Exception;
}
