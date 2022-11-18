package com.sgworld.infra.modules.admin.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminCodeGroupServiceImpl implements AdminCodeGroupService {
	
	@Autowired
	AdminCodeGroupDao dao;

	@Override
	public List<CodeGroupDto> selectList(CodeGroupVo vo) throws Exception {
		List<CodeGroupDto> list = dao.selectList(vo);
		return list;
	}

	@Override
	public int selectOneCount(CodeGroupVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}

	@Override
	public CodeGroupDto selectOne(CodeGroupVo vo) throws Exception {
		return dao.selectOne(vo);
	}

	@Override
	public int insert(CodeGroupDto dto) throws Exception {
		return dao.insert(dto);
	}
	
}
