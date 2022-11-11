package com.sgworld.infra.modules.user.sgWorld;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwDto;

@Repository
public class SgwDao {

	@Inject
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	public static String namespace = "com.sgworld.infra.modules.user.sgWorld.SgwMapper";
	
	public int buildSgw (SgwDto sgwDto) {
		System.out.println("SgwDao.buildSgw() :: shWorld 방 개설에 필요한 정보를 DB로 전달합니다.");
		return sqlSession.insert(namespace + ".buildSgw", sgwDto);
	}
	
}
