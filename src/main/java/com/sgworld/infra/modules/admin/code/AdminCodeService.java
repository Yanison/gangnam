package com.sgworld.infra.modules.admin.code;

import java.util.List;

public interface AdminCodeService {
	
	//admin cc리스트
	public List<CodeDto>selectList(CodeVo vo)throws Exception;
	
	//admin cc카운트
	public int selectOneCount(CodeVo vo)throws Exception;
	
	//admin cc등록
	public int insert(CodeDto dto)throws Exception;
	
	//admin ccg리스트 띄우기
	public List<CodeDto>viewList()throws Exception;
	
	//admin cc view
	public CodeDto selectOne(CodeVo vo)throws Exception;
	
	//admin 수정
	public int update(CodeDto dto)throws Exception;
	
	//admin 부분삭제
	public int uelete(CodeDto dto)throws Exception;
	
	//admin 완전삭제
	public int delete(CodeVo vo)throws Exception;

}
