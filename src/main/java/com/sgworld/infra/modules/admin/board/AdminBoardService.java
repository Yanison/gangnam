package com.sgworld.infra.modules.admin.board;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;


public interface AdminBoardService {

	public void setRegMod(AdminBoardDto dto) throws Exception;
	public void uploadFiles(MultipartFile[] multipartFiles, AdminBoardDto dto, String tableName, int type, int maxNumber) throws Exception;
	public void deleteFiles(String[] deleteSeq, String[] deletePathFile, AdminBoardDto dto, String tableName) throws Exception;
	public void ueleteFiles(String[] deleteSeq, String[] deletePathFile, AdminBoardDto dto, String tableName) throws Exception;
	
	public List<AdminBoardDto> selectList(AdminBoardVo vo) throws Exception;
	public int selectOneCount(AdminBoardVo vo) throws Exception;
	public AdminBoardDto selectOne(AdminBoardVo vo) throws Exception;
	
	//공통코드
	public List<AdminBoardDto> ccNameList() throws Exception;
	
	List<AdminBoardDto> selectListUploaded(AdminBoardVo vo) throws Exception;
	
	//관리자 글쓰기
	public int insert(AdminBoardDto dto) throws Exception;
	public int update(AdminBoardDto dto) throws Exception;
	public int uelete(AdminBoardDto dto) throws Exception;
	public int delete(AdminBoardVo vo) throws Exception;
	
	//댓글
	public List<AdminBoardDto> selectCommentList(AdminBoardVo vo) throws Exception;
	public int commentInst(AdminBoardDto dto) throws Exception;
	
	//조회수
	public int boardViewCount(AdminBoardDto dto) throws Exception;

	//좋아요
	public int boardLikeCount(AdminBoardVo vo) throws Exception;
	public AdminBoardDto boardLiked(AdminBoardVo vo) throws Exception;
	public int insertLike(AdminBoardDto dto) throws Exception;
	public int deleteLike(AdminBoardVo vo) throws Exception;
}

