package com.sgworld.infra.modules.user.home;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwDto;

@Repository
public class HomeDao {
	
	@Inject
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	public static String namespace = "com/sgworld/infra/modules/user/home/HomeMapper";
	
	public List<SgwDto> selectSgwList(SgwDto sgwDto){
		return sqlSession.selectList(namespace+".selectSgwList", sgwDto);
	}
	
}
