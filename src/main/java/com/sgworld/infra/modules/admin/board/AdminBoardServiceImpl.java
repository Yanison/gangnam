package com.sgworld.infra.modules.admin.board;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.sgworld.infra.common.base.BaseServiceImpl;
import com.sgworld.infra.common.constants.Constants;
import com.sgworld.infra.common.util.UtilDateTime;
import com.sgworld.infra.common.util.UtilRegMod;

@Service
public class AdminBoardServiceImpl extends BaseServiceImpl implements AdminBoardService {

	@Autowired
	AdminBoardDao dao;
	
	@Override
	public void setRegMod(AdminBoardDto dto) throws Exception {
		HttpServletRequest httpServletRequest = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		dto.setRegIp(UtilRegMod.getClientIp(httpServletRequest));
		dto.setRegSeq(UtilRegMod.getSessionSeq(httpServletRequest));
		dto.setRegDeviceCd(UtilRegMod.getDevice());
		dto.setRegDateTime(UtilDateTime.nowDate());
		
		dto.setModIp(UtilRegMod.getClientIp(httpServletRequest));
		dto.setModSeq(UtilRegMod.getSessionSeq(httpServletRequest));
		dto.setModDeviceCd(UtilRegMod.getDevice());
		dto.setModDateTime(UtilDateTime.nowDate());
		
	}
	
	@Override
	public void uploadFiles(MultipartFile[] multipartFiles, AdminBoardDto dto, String tableName, int type, int maxNumber) throws Exception {
			
		for(int i=0; i<multipartFiles.length; i++) {
	    	
			if(!multipartFiles[i].isEmpty()) {
				
				String className = dto.getClass().getSimpleName().toString().toLowerCase();		
				String fileName = multipartFiles[i].getOriginalFilename();
				String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
				String uuid = UUID.randomUUID().toString();
				String uuidFileName = uuid + "." + ext;
				String pathModule = className;
				String nowString = UtilDateTime.nowString();
				String pathDate = nowString.substring(0,4) + "/" + nowString.substring(5,7) + "/" + nowString.substring(8,10); 
				String path = Constants.UPLOAD_PATH_PREFIX + "/" + pathModule + "/" + pathDate + "/";
				String pathForView = Constants.UPLOAD_PATH_PREFIX_FOR_VIEW + "/" + pathModule + "/" + pathDate + "/";
				
				File uploadPath = new File(path);
				
				if (!uploadPath.exists()) {
					uploadPath.mkdir();
				} else {
					// by pass
				}
				  
				multipartFiles[i].transferTo(new File(path + uuidFileName));
				
				dto.setPath(pathForView);
				dto.setOriginalName(fileName);
				dto.setUuidName(uuidFileName);
				dto.setExt(ext);
				dto.setSize(multipartFiles[i].getSize());
				
				dto.setTableName(tableName);
				dto.setType(type);
//				dto.setDefaultNy();
				dto.setSort(maxNumber + i);
				dto.setpSeq(dto.getBdSeq());

				dao.insertUploaded(dto);
    		}
		}
		
	}
	
	@Override
	public List<AdminBoardDto> selectList(AdminBoardVo vo) throws Exception {
		List<AdminBoardDto> list = dao.selectList(vo);
		return list;
	}

	@Override
	public int selectOneCount(AdminBoardVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}

	@Override
	public AdminBoardDto selectOne(AdminBoardVo vo) throws Exception {
		AdminBoardDto item = dao.selectOne(vo);
		return item;
	}
	
	//????????????
	@Override
	public List<AdminBoardDto> ccNameList() throws Exception {
		return dao.ccNameList();
	}
	
	@Override
	public int insert(AdminBoardDto dto) throws Exception { 
		
		//setRegMod(dto);
		dao.insert(dto);
		//uploadFiles(dto.getUploadImg(), dto, "boardUploaded", dto.getUploadImgType(), dto.getUploadImgMaxNumber());
		//uploadFiles(dto.getUploadFile(), dto, "boardUploaded", dto.getUploadFileType(), dto.getUploadFileMaxNumber());
		return 1; 
	}
		
	@Override
	public int update(AdminBoardDto dto) throws Exception { return dao.update(dto); }
		
	@Override
	public int uelete(AdminBoardDto dto) throws Exception { return dao.uelete(dto); }
		
	@Override
	public int delete(AdminBoardVo vo) throws Exception { return dao.delete(vo); }

	@Override
	public void deleteFiles(String[] deleteSeq, String[] deletePathFile, AdminBoardDto dto, String tableName) throws Exception {
			
		for (int i=0; i<deleteSeq.length; i++) {
			File file = new File(Constants.UPLOAD_PATH_PREFIX_EXTERNAL + deletePathFile[i]);
        
			boolean result = file.delete();
            
            if(result) {
            	dto.setSeq(deleteSeq[i]);
            	dto.setTableName(tableName);
            	dao.deleteUploaded(dto);
            }
		}
	}

	@Override
	public void ueleteFiles(String[] deleteSeq, String[] deletePathFile, AdminBoardDto dto, String tableName) throws Exception {
			
		for (int i=0; i<deleteSeq.length; i++) {
//			File file = new File(Constants.UPLOAD_PATH_PREFIX_EXTERNAL + deletePathFile[i]);
//			boolean result = file.delete();
			
//			if(result) {
				dto.setSeq(deleteSeq[i]);
				dto.setTableName(tableName);
				dao.ueleteUploaded(dto);
//			}
		}
	}

	@Override
	public List<AdminBoardDto> selectListUploaded(AdminBoardVo vo) throws Exception {
		return dao.selectListUploaed(vo);
	}
	
	//??????
	@Override
	public List<AdminBoardDto> selectCommentList(AdminBoardVo vo) throws Exception {
		List<AdminBoardDto> list = dao.selectCommentList(vo);
		return list;
	}
	
	@Override
	public int selectCommentCount(AdminBoardVo vo) throws Exception { return dao.selectCommentCount(vo); }
		
	@Override
	public int commentInst(AdminBoardDto dto) throws Exception { return dao.commentInst(dto); }

	@Override
	public int commentDele(AdminBoardVo vo) throws Exception { return dao.commentDele(vo); }
		
	
	
	//?????????
	@Override
	public int boardViewCount(AdminBoardDto dto) throws Exception { return dao.boardViewCount(dto); }

	//?????????
	@Override
	public int boardLikeCount(AdminBoardVo vo) throws Exception { return dao.boardLikeCount(vo); }
	
	@Override
	public AdminBoardDto boardLiked(AdminBoardVo vo) throws Exception { return dao.boardLiked(vo); }
		
	@Override
	public int insertLike(AdminBoardDto dto) throws Exception { return dao.insertLike(dto); }
		
	@Override
	public int deleteLike(AdminBoardVo vo) throws Exception { return dao.deleteLike(vo); }

	//?????? ????????? ?????????
	@Override
	public List<AdminBoardDto> recommentList(AdminBoardVo vo) throws Exception {return dao.recommentList(vo);}
	
	//????????????
	@Override
	public int reComentInst(AdminBoardDto dto) throws Exception {return dao.reComentInst(dto);}

	@Override
	public int selectReCommentCount(AdminBoardVo vo) throws Exception {return dao.selectReCommentCount(vo);}

	
	
	
	

}
