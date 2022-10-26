package com.sgworld.infra.modules.admin.membergroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class MemberGroupServiceImpl implements MemberGroupService {
	
	@Autowired
	MemberGroupDao mmDao;

	public List<MemberGroup> selectMmList(MemberGroup dto) throws Exception{
		return mmDao.selectMmList(dto);
	}
}
