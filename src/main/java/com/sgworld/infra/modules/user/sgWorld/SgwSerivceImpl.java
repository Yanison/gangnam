package com.sgworld.infra.modules.user.sgWorld;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgworld.infra.modules.user.sgWorld.Controller.SgwWSController;
import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwChat;
import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwDto;

@Service
public class SgwSerivceImpl implements SgwSerivce {
	@Autowired
	SgwDao sgwDao;
	
	@Autowired
	SgwWSController sgwWSController;
	
	/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 * @@@@@@ sgw
	 * @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 */
	@Override
	public int buildSgw (SgwDto sgwDto)throws Exception{
		System.out.println("SgwSerivceImpl.buildSgw() :: shWorld 방 개설 서비스 로직을 수행합니.");
		return sgwDao.buildSgw(sgwDto);
	}
	@Override
	public SgwDto onLoadInfoSgw(SgwDto sgwDto)throws Exception{
		return sgwDao.onLoadInfoSgw(sgwDto);
	}
	@Override
	public int onLiveNy(SgwDto sgwDto)throws Exception{
		return sgwDao.onLiveNy(sgwDto);
	}
	@Override
	public int addUserSgwRoom(SgwDto sgwDto) throws Exception{
		return sgwDao.addUserSgwRoom(sgwDto);
	}
	/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 * @@@@@@ user
	 * @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 */
	@Override
	public int isDupleLink(SgwDto sgwDto)throws Exception{
		return sgwDao.isDupleLink(sgwDto);
	}
	@Override
	public int didHeAlreadyMadeSgw(SgwDto sgwDto)throws Exception{
		return sgwDao.didHeAlreadyMadeSgw(sgwDto);
	}
	
	@Override
	public SgwDto findSgwbyMmSeq(SgwDto sgwDto)throws Exception{
		return sgwDao.findSgwbyMmSeq(sgwDto);
	}
	
	@Override
	public SgwDto findMm(SgwDto sgwDto)throws Exception{
		return sgwDao.findMm(sgwDto);
	}

	@Override
	public SgwDto onLoadUserInfoSgw(SgwDto sgwDto)throws Exception{
		return sgwDao.onLoadUserInfoSgw(sgwDto);
	}
	@Override
	public int insertRoomUser(SgwDto sgwDto)throws Exception{
		return sgwDao.insertRoomUser(sgwDto);
	}
	@Override
	public int deleteRoomUser(SgwDto sgwDto)throws Exception{
		return sgwDao.deleteRoomUser(sgwDto);
	}
	@Override
	public List<SgwChat>  findRoomMm(SgwChat sgwChat)throws Exception{
		return sgwDao.findRoomMm(sgwChat);
	}
	@Override
	public SgwChat findRoomMmOne(SgwChat sgwChat)throws Exception{
		return sgwDao.findRoomMmOne(sgwChat);
	}
	@Override
	public int findMmRoomOne(SgwDto sgwDto)throws Exception{
		return sgwDao.findMmRoomOne(sgwDto);
	}
}
