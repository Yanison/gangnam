package com.sgworld.infra.modules.admin.board;

import java.util.List;

public interface AdminBoardService {

	public List<AdminBoardDto> selectList(AdminBoardVo vo) throws Exception;
	public int selectOneCount(AdminBoardVo vo) throws Exception;
	public AdminBoardDto selectOne(AdminBoardVo vo) throws Exception;
	
	//글쓰기
	public int insert(AdminBoardDto dto) throws Exception;
	public int update(AdminBoardDto dto) throws Exception;
	public int uelete(AdminBoardDto dto) throws Exception;
	public int delete(AdminBoardVo vo) throws Exception;
}
