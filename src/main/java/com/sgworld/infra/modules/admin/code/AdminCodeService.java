package com.sgworld.infra.modules.admin.code;

import java.util.List;

public interface AdminCodeService {
	
	//admin cc리스트
	public List<CodeDto>selectList(CodeVo vo)throws Exception;

}
