package com.sgworld.infra.modules.user.sgWorld;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgworld.infra.modules.user.sgWorld.Controller.SgwWSController;
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
	public SgwDto onLoadUserInfoSgw(SgwDto sgwDto)throws Exception{
		return sgwDao.onLoadInfoSgw(sgwDto);
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
	public int doesHeAlreadyMakeSgw(SgwDto sgwDto)throws Exception{
		return sgwDao.doesHeAlreadyMakeSgw(sgwDto);
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
	public SgwDto onLoadInfoSgw(SgwDto sgwDto)throws Exception{
		return sgwDao.onLoadUserInfoSgw(sgwDto);
	}
	
	
	
	
	
	
	

}
