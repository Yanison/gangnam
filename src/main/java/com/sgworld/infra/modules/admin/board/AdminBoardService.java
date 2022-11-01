package com.sgworld.infra.modules.admin.board;

import java.util.List;

public interface AdminBoardService {

	public List<BoardDto> selectList(BoardVo vo) throws Exception;
	public int selectOneCount(BoardVo vo) throws Exception;
	public BoardDto selectOne(BoardVo vo) throws Exception;
}
