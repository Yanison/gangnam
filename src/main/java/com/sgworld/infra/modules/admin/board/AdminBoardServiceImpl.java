package com.sgworld.infra.modules.admin.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {

	@Autowired
	AdminBoardDao dao;
	
	@Override
	public List<AdminBoardDto> selectList(AdminBoardVo vo) throws Exception {
		List<AdminBoardDto> list = dao.selectList(vo);
		return list;
	}

	@Override
	public int selectOneCount(AdminBoardVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}

	@Override
	public AdminBoardDto selectOne(AdminBoardVo vo) throws Exception {
		AdminBoardDto item = dao.selectOne(vo);
		return item;
	}
	
	@Override
	public int insert(AdminBoardDto dto) throws Exception { return dao.insert(dto); }
		
	@Override
	public int update(AdminBoardDto dto) throws Exception { return dao.update(dto); }
		
	@Override
	public int uelete(AdminBoardDto dto) throws Exception { return dao.uelete(dto); }
		
	@Override
	public int delete(AdminBoardVo vo) throws Exception { return dao.delete(vo); }

}
