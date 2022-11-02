package com.sgworld.infra.modules.user.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao dao;

	@Override
	public List<Board> selectList(BoardVo vo) throws Exception {
		List<Board> list = dao.selectList(vo);
		return list;
	}

	@Override
	public int selectOneCount(BoardVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}

	@Override
	public Board selectOne(BoardVo vo) throws Exception {
		Board item = dao.selectOne(vo);
		return item;
	}

	@Override
	public int insert(Board dto) throws Exception { return dao.insert(dto); }
		
	@Override
	public int update(Board dto) throws Exception { return dao.update(dto); }
		
	@Override
	public int uelete(Board dto) throws Exception { return dao.uelete(dto); }
		
	@Override
	public int delete(BoardVo vo) throws Exception { return dao.delete(vo); }
		
	
}
