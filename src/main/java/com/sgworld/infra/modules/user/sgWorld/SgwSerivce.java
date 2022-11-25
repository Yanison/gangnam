package com.sgworld.infra.modules.user.sgWorld;

import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwDto;

public interface SgwSerivce {
	
	/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 * @@@@@@ sgw
	 * @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 */
	public int buildSgw (SgwDto sgwDto)throws Exception;
	public SgwDto onLoadInfoSgw(SgwDto sgwDto)throws Exception;
	public int onLiveNy(SgwDto sgwDto)throws Exception;
	public int addUserSgwRoom(SgwDto sgwDto) throws Exception;
	/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 * @@@@@@ sgw
	 * @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 */
	public int isDupleLink(SgwDto sgwDto)throws Exception;
	public int didHeAlreadyMadeSgw(SgwDto sgwDto)throws Exception;
	public SgwDto findSgwbyMmSeq(SgwDto sgwDto)throws Exception;
	public SgwDto findMm(SgwDto sgwDto)throws Exception;
	
	public SgwDto onLoadUserInfoSgw(SgwDto sgwDto)throws Exception;
	

}
