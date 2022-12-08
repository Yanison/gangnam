package com.sgworld.infra.modules.user.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwDto;

@Service
public class HomeServiceImpl {
	@Autowired
	HomeDao homeDao;
	
	public List<SgwDto> selectSgwList(SgwDto sgwDto){
		return homeDao.selectSgwList(sgwDto);
	}
}
