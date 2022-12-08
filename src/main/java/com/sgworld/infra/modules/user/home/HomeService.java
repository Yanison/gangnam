package com.sgworld.infra.modules.user.home;

import java.util.List;

import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwDto;

public interface HomeService {
	public List<SgwDto> selectSgwList(SgwDto sgwDto);
}
