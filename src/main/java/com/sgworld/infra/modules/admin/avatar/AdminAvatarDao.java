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
	
	public List<AvatarDto> selectList(AvatarVo vo) {
		List<AvatarDto> list = sqlSession.selectList(namespace + ".selectList", vo);
		return list;
	}
	
	public int selectOneCount(AvatarVo vo) { return sqlSession.selectOne(namespace + ".selectOneCount", vo); }
	public AvatarDto selectOne(AvatarVo vo) { return sqlSession.selectOne(namespace + ".selectOne", vo); }

	//아바타 등록
	public int insert(AvatarDto dto) { return sqlSession.insert(namespace + ".insert", dto); }
	public int update(AvatarDto dto) { return sqlSession.update(namespace + ".update", dto); }
	public int uelete(AvatarDto dto) { return sqlSession.update(namespace + ".uelete", dto); }
	public int delete(AvatarVo vo) { return sqlSession.delete(namespace + ".delete", vo); }
	
	//관리자 업로드
	public int insertUploaded(AvatarDto dto) { return sqlSession.insert("Base" + ".insertUploaded", dto); }
	public int ueleteUploaded(AvatarDto dto) { return sqlSession.insert("Base" + ".ueleteUploaded", dto); }
	public int deleteUploaded(AvatarDto dto) { return sqlSession.insert("Base" + ".deleteUploaded", dto); }
	
	public List<AvatarDto> selectListUploaed(AvatarVo vo) { return sqlSession.selectList(namespace + ".selectListUploaded", vo); }
}
