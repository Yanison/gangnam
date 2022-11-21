package com.sgworld.infra.modules.admin.avatar;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;



public interface AdminAvatarService {

	public void setRegMod(AvatarDto dto) throws Exception;
	public void uploadFiles(MultipartFile[] multipartFiles, AvatarDto dto, String tableName, int type, int maxNumber) throws Exception;
	public void deleteFiles(String[] deleteSeq, String[] deletePathFile, AvatarDto dto, String tableName) throws Exception;
	public void ueleteFiles(String[] deleteSeq, String[] deletePathFile, AvatarDto dto, String tableName) throws Exception;

	List<AvatarDto> selectListUploaded(AvatarDto vo) throws Exception;

}
