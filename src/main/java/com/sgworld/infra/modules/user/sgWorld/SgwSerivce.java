package com.sgworld.infra.modules.user.sgWorld;

import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwDto;

public interface SgwSerivce {
	public int buildSgw (SgwDto sgwDto)throws Exception;
	public int isDupleLink(SgwDto sgwDto)throws Exception;
	public int doesHeAlreadyMakeSgw(SgwDto sgwDto)throws Exception;
	public SgwDto findSgwbyMmSeq(SgwDto sgwDto)throws Exception;
	public SgwDto findMm(SgwDto sgwDto)throws Exception;

}
