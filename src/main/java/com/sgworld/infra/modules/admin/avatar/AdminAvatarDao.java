package com.sgworld.infra.modules.admin.avatar;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;



@Repository
public class AdminAvatarDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.sgworld.infra.modules.admin.avatar.AdminAvatarMapper";

	//관리자 업로드
	public int insertUploaded(AvatarDto dto) { return sqlSession.insert("Base" + ".insertUploaded", dto); }
	public int ueleteUploaded(AvatarDto dto) { return sqlSession.insert("Base" + ".ueleteUploaded", dto); }
	public int deleteUploaded(AvatarDto dto) { return sqlSession.insert("Base" + ".deleteUploaded", dto); }
	
	public List<AvatarDto> selectListUploaed(AvatarDto vo) { return sqlSession.selectList(namespace + ".selectListUploaded", vo); }
}
