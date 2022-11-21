package com.sgworld.infra.modules.admin.avatar;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;





public interface AdminAvatarService {

	public void setRegMod(AvatarDto dto) throws Exception;
	public void uploadFiles(MultipartFile[] multipartFiles, AvatarDto dto, String tableName, int type, int maxNumber) throws Exception;
	public void deleteFiles(String[] deleteSeq, String[] deletePathFile, AvatarDto dto, String tableName) throws Exception;
	public void ueleteFiles(String[] deleteSeq, String[] deletePathFile, AvatarDto dto, String tableName) throws Exception;

	public List<AvatarDto> selectList(AvatarVo vo) throws Exception;
	public int selectOneCount(AvatarVo vo) throws Exception;
	public AvatarDto selectOne(AvatarVo vo) throws Exception;
	
	List<AvatarDto> selectListUploaded(AvatarVo vo) throws Exception;
	
	//관리자 아바타 등록
	public int insert(AvatarDto dto) throws Exception;
	public int update(AvatarDto dto) throws Exception;
	public int uelete(AvatarDto dto) throws Exception;
	public int delete(AvatarVo vo) throws Exception;
	

}
