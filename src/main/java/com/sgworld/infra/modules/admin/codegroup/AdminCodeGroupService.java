package com.sgworld.infra.modules.admin.codegroup;

import java.util.List;

public interface AdminCodeGroupService {
	
	public List<CodeGroupDto> selectList(CodeGroupVo vo) throws Exception;
	public int selectOneCount(CodeGroupVo vo) throws Exception;
	public CodeGroupDto selectOne(CodeGroupVo vo) throws Exception;
	
	//admin ccg등록
	public int insert(CodeGroupDto dto)throws Exception;
	
	public int update(CodeGroupDto dto)throws Exception;

	public int uelete(CodeGroupDto dto)throws Exception;

	public int delete(CodeGroupVo vo)throws Exception;


}
