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
	public int userUpdate(MemberGroup dto) throws Exception {
		return mmDao.userUpdate(dto);
	}


	@Override
	public int insertMmSignIn (MemberGroup dto) throws Exception{
		return mmDao.insertMmSignIn(dto);
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

	@Override
	public int selectOneCount(MemberGroupVo vo) throws Exception {
		return mmDao.selectOneCount(vo);
	}

	//로그인
	@Override
	public MemberGroup selectUserLogin(MemberGroup dto) throws Exception {
		return mmDao.selectUserLogin(dto);
	}
	
	@Override
	public MemberGroup selectOneId(MemberGroup dto) throws Exception {
		return mmDao.selectOneId(dto);
	}

	@Override
	public MemberGroup selectOneLogin(MemberGroup dto) throws Exception {
		return mmDao.selectOneLogin(dto);
	}
	
	
	
	
	
}
