package com.sgworld.infra.modules.admin.membergroup;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberGroupDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	public static String namespace = "com.sgworld.infra.modules.admin.membergroup.MemberGroupMapper";
	
	public List<MemberGroup> selectMmList(MemberGroup dto){
		return sqlSession.selectList(namespace + ".selectMmList", dto);
	}
	
	public MemberGroup selectMmOne(MemberGroupVo vo) {
		return sqlSession.selectOne(namespace +".selectMmOne", vo);
	}
	
	public int insertMmSignIn (MemberGroup dto) {
		return sqlSession.insert(namespace + "insertMmSignIn", dto);
	}
	
	public MemberGroup selectUserLogin(MemberGroup dto) {
		return sqlSession.selectOne(namespace + ".selectUserLogin", dto);
	}
	
	//회원정보 수정
	public int udptMmifo(MemberGroup dto) {
		return sqlSession.update(namespace +".udptMmifo", dto);
	}
}
