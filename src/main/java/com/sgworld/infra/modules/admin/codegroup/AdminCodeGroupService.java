package com.sgworld.infra.modules.admin.codegroup;

import java.util.List;

public interface AdminCodeGroupService {
	
	public List<CodeGroupDto> selectList(CodeGroupVo vo) throws Exception;
	public int selectOneCount(CodeGroupVo vo) throws Exception;
	public CodeGroupDto selectOne(CodeGroupVo vo) throws Exception;
}
