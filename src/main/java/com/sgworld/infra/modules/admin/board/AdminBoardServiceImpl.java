package com.sgworld.infra.modules.admin.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {

	@Autowired
	AdminBoardDao dao;
	
	@Override
	public List<BoardDto> selectList(BoardVo vo) throws Exception {
		List<BoardDto> list = dao.selectList(vo);
		return list;
	}

	@Override
	public int selectOneCount(BoardVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}

	@Override
	public BoardDto selectOne(BoardVo vo) throws Exception {
		BoardDto item = dao.selectOne(vo);
		return item;
	}

}
