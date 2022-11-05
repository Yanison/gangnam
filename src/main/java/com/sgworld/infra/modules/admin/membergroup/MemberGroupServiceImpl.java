package com.sgworld.infra.modules.admin.membergroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberGroupServiceImpl implements MemberGroupService {
	
	@Autowired
	MemberGroupDao mmDao;
	
	@Override
	public List<MemberGroup> selectMmList(MemberGroup dto) throws Exception{
		return mmDao.selectMmList(dto);
	}
	
	
	@Override
	public MemberGroup selectMmOne(MemberGroupVo vo) throws Exception {
		return mmDao.selectMmOne(vo);
	}

	@Override
	public int insertMmSignIn (MemberGroup dto) throws Exception{
		return mmDao.insertMmSignIn(dto);
	}
	
	@Override
	public MemberGroup selectUserLogin(MemberGroup dto) throws Exception{
		return mmDao.selectUserLogin(dto);
	}
	
	@Override
	public int isduple(MemberGroup dto) throws Exception{
		return mmDao.isduple(dto);
	}


	@Override
	public int udptMmifo(MemberGroup dto) throws Exception {
		return mmDao.udptMmifo(dto);
	}
	
	@Override
	public List<MemberGroup> selectListBoard(MemberGroupVo vo) throws Exception {
		return mmDao.selectListBoard(vo);
	}

	@Override
	public int ueleteMm(MemberGroup dto) throws Exception {
		return mmDao.ueleteMm(dto);
	}
	
	

}
