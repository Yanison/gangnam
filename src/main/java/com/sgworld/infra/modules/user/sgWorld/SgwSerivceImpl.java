package com.sgworld.infra.modules.user.sgWorld;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwDto;

@Service
public class SgwSerivceImpl implements SgwSerivce {
	@Autowired
	SgwDao sgwDao;
	
	@Override
	public int buildSgw (SgwDto sgwDto)throws Exception{
		System.out.println("SgwSerivceImpl.buildSgw() :: shWorld 방 개설 서비스 로직을 수행합니.");
		return sgwDao.buildSgw(sgwDto);
	}

}
