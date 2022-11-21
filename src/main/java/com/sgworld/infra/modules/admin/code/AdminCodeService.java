package com.sgworld.infra.modules.admin.code;

import java.util.List;

public interface AdminCodeService {
	
	//admin cc리스트
	public List<CodeDto>selectList(CodeVo vo)throws Exception;
	
	//admin cc카운트
	public int selectOneCount(CodeVo vo)throws Exception;

}
