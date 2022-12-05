package com.sgworld.infra.modules.user.sgWorld;

import java.util.List;

import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwChat;
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
	public int insertRoomUser(SgwDto sgwDto)throws Exception;
	public int deleteRoomUser(SgwChat sgwChat)throws Exception;
	public List<SgwChat>  findRoomMm(SgwChat sgwChat)throws Exception;
	public SgwChat findRoomMmOne(SgwChat sgwChat)throws Exception;
	public int findMmRoomOne(SgwDto sgwDto)throws Exception;
}
