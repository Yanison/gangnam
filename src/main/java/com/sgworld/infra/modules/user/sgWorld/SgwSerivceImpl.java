package com.sgworld.infra.modules.user.sgWorld;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgworld.infra.modules.user.sgWorld.sgwSocket.SgwWSController;
import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwDto;

@Service
public class SgwSerivceImpl implements SgwSerivce {
	@Autowired
	SgwDao sgwDao;
	
	@Autowired
	SgwWSController sgwWSController;
	
	@Override
	public int buildSgw (SgwDto sgwDto)throws Exception{
		System.out.println("SgwSerivceImpl.buildSgw() :: shWorld 방 개설 서비스 로직을 수행합니.");
		return sgwDao.buildSgw(sgwDto);
	}
	
	@Override
	public SgwDto selectSgwOne(SgwDto sgwDto) throws Exception{
		System.out.println("SgwSerivceImpl.selectSgwOne() :: 최근 개설된 방의 정보를 전달 받았습니다.");
		return sgwDao.selectSgwOne(sgwDto);
	}
	
	@Override
	public int isDupleLink(SgwDto sgwDto)throws Exception{
		return sgwDao.isDupleLink(sgwDto);
	}
	@Override
	public int doesHealreadyMakeSgw(SgwDto sgwDto)throws Exception{
		return sgwDao.doesHealreadyMakeSgw(sgwDto);
	}
	
	@Override
	public SgwDto goMySgw(SgwDto sgwDto)throws Exception{
		return sgwDao.goMySgw(sgwDto);
	}
	
	
	
	
	
	
	

}
