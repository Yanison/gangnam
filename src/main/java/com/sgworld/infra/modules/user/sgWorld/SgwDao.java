package com.sgworld.infra.modules.user.sgWorld;

import java.util.List;

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
	/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 * @@@@@@ sgw
	 * @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 */
	public int buildSgw (SgwDto sgwDto) {
		System.out.println(
				"SgwDao.buildSgw() :: shWorld 방 개설에 필요한 정보를 DB로 전달합니다." + "\n" +
				"개설된 Sgworld 정보는 다음과 같습니다."+ "\n" +
				"방 이름 :: " + sgwDto.getSgwTitle() +"\n" +
				"방 비공개여부 :: " +sgwDto.getIsHidden()+ "\n" +
				"방 인원제한수 :: " +sgwDto.getSgwMmNumber()+ "\n" +
				"방 맵 :: " + sgwDto.getSgwMap()+"\n" +
				"방장 시퀀스//닉네임 :: "+sgwDto.getInfrMmSeq()+" // " +sgwDto.getInfrMmNickname()+ "\n" + ""

				);
		
		return sqlSession.insert(namespace + ".buildSgw", sgwDto);
	}
	public SgwDto onLoadInfoSgw(SgwDto sgwDto) {
		return sqlSession.selectOne(namespace+".onLoadInfoSgw", sgwDto);
	}
	/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 * @@@@@@ user
	 * @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 */
	public SgwDto findSgwbyMmSeq(SgwDto sgwDto) {
		System.out.println(
				"SgwDao.selectSgwOne :: 최근 개설된 Sgworld 하나를 불러옵니다." + "\n"+
				"개설된 Sgworld 정보는 다음과 같습니다."+ "\n" +
				"방 시퀀스 :: " + sgwDto.getSgwSeq() +"\n" +
				"방 이름 :: " + sgwDto.getSgwTitle() +"\n" +
				"방 비공개여부 :: " +sgwDto.getIsHidden()+ "\n" +
				"방 인원제한수 :: " +sgwDto.getSgwMmNumber()+ "\n" +
				"방 맵 :: " + sgwDto.getSgwMap()+"\n" +
				"방 링크 :: " + sgwDto.getSgwLink()+"\n" +
				"방장 시퀀스//닉네임 :: "+sgwDto.getInfrMmSeq()+" // " +sgwDto.getInfrMmNickname()+ "\n" +
				"방 생성시간 :: " + "\n" + ""
				);
		return sqlSession.selectOne(namespace + ".findSgwbyMmSeq", sgwDto);
	}
	public SgwDto onLoadUserInfoSgw(SgwDto sgwDto) {
		
		return sqlSession.selectOne(namespace+".onLoadUserInfoSgw", sgwDto);
	}
	public int isDupleLink(SgwDto sgwDto){
		return sqlSession.selectOne(namespace+".isDupleLink", sgwDto);
	}
	
	public int doesHeAlreadyMakeSgw(SgwDto sgwDto){
		return sqlSession.selectOne(namespace+".doesHealreadyMakeSgw", sgwDto);
	}
	
	public SgwDto findMm(SgwDto sgwDto) {
		return sqlSession.selectOne(namespace+".findMm", sgwDto);
	}
}
