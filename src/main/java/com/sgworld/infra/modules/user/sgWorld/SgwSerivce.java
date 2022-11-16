package com.sgworld.infra.modules.user.sgWorld;

import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwDto;

public interface SgwSerivce {
	public int buildSgw (SgwDto sgwDto)throws Exception;
	public SgwDto selectSgwOne(SgwDto sgwDto) throws Exception;
	public int isDupleLink(SgwDto sgwDto)throws Exception;
	public int doesHealreadyMakeSgw(SgwDto sgwDto)throws Exception;
	public SgwDto goMySgw(SgwDto sgwDto)throws Exception;

}
