package com.sgworld.infra.modules.admin.membergroup;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.sgworld.infra.common.constants.Constants;
import com.sgworld.infra.common.util.UtilDateTime;
import com.sgworld.infra.common.util.UtilRegMod;


@Service
public class MemberGroupServiceImpl implements MemberGroupService {
	
	@Autowired
	MemberGroupDao mmDao;
	
	@Override
	public void uploadFiles(MultipartFile[] multipartFiles, MemberGroup dto, String tableName, int type, int maxNumber) throws Exception {
			
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
				dto.setpSeq(dto.getInfrMmSeq());

				mmDao.insertUploaded(dto);
    		}
		}
		
	}

	@Override
	public void deleteFiles(String[] deleteSeq, String[] deletePathFile, MemberGroup dto, String tableName) throws Exception {
		for (int i=0; i<deleteSeq.length; i++) {
			File file = new File(Constants.UPLOAD_PATH_PREFIX_EXTERNAL + deletePathFile[i]);
        
			boolean result = file.delete();
            
            if(result) {
            	dto.setSeq(deleteSeq[i]);
            	dto.setTableName(tableName);
            	mmDao.deleteUploaded(dto);
            }
		}
	}

	@Override
	public void ueleteFiles(String[] deleteSeq, String[] deletePathFile, MemberGroup dto, String tableName) throws Exception {
		for (int i=0; i<deleteSeq.length; i++) {
//			File file = new File(Constants.UPLOAD_PATH_PREFIX_EXTERNAL + deletePathFile[i]);
//			boolean result = file.delete();
			
//			if(result) {
				dto.setSeq(deleteSeq[i]);
				dto.setTableName(tableName);
				mmDao.ueleteUploaded(dto);
//			}
		}
	}

	@Override
	public void setRegMod(MemberGroup dto) throws Exception {
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
	public List<MemberGroup> selectMmList(MemberGroupVo vo) throws Exception{
		return mmDao.selectMmList(vo);
	}
	
	
	@Override
	public MemberGroup selectMmOne(MemberGroupVo vo) throws Exception {
		return mmDao.selectMmOne(vo);
	}
	
	@Override
	public int userUpdate(MemberGroup dto) throws Exception {
		return mmDao.userUpdate(dto);
	}


	@Override
	public int insertMmSignIn (MemberGroup dto) throws Exception{
		return mmDao.insertMmSignIn(dto);
	}
	
	@Override
	public int isduple(MemberGroup dto) throws Exception{
		return mmDao.isduple(dto);
	}

	@Override
	public int udptMmifo(MemberGroup dto) throws Exception {
		return mmDao.udptMmifo(dto);
	}

	@Override
	public List<MemberGroup> selectListBoard(MemberGroupVo vo) throws Exception {
		return mmDao.selectListBoard(vo);
	}

	@Override
	public int ueleteMm(MemberGroup dto) throws Exception {
		return mmDao.ueleteMm(dto);
	}

	@Override
	public int selectOneCount(MemberGroupVo vo) throws Exception {
		return mmDao.selectOneCount(vo);
	}

	//로그인
	@Override
	public MemberGroup selectUserLogin(MemberGroup dto) throws Exception {
		return mmDao.selectUserLogin(dto);
	}
	
	@Override
	public MemberGroup selectOneXdminId(MemberGroup dto) throws Exception {
		return mmDao.selectOneXdminId(dto);
	}

	@Override
	public MemberGroup selectOneXdminLogin(MemberGroup dto) throws Exception {
		return mmDao.selectOneXdminLogin(dto);
	}


	@Override
	public int adminUpdate(MemberGroup dto) throws Exception {
		return mmDao.adminUpdate(dto);
	}


	@Override
	public int adminUelete(MemberGroup dto) throws Exception {
		return mmDao.adminUelete(dto);
	}


	@Override
	public int adminDelete(MemberGroupVo vo) throws Exception {
		return mmDao.adminDelete(vo);
	}


	@Override
	public int selectCount(MemberGroupVo vo) throws Exception {
		return mmDao.selectCount(vo);
	}
	
	public int memberInst(MemberGroup dto)throws Exception{
		setRegMod(dto);
		uploadFiles(dto.getUploadImg(), dto, "memberUploaded", dto.getUploadImgType(), dto.getUploadImgMaxNumber());
		return 1;
	}
	
	public int memberUploaded(MemberGroup dto)throws Exception{
		setRegMod(dto);
		
		deleteFiles(dto.getUploadImgDeleteSeq(), dto.getUploadImgDeletePathFile(), dto, "memberUploaded");
		uploadFiles(dto.getUploadImg(), dto, "memberUploaded", dto.getUploadImgType(), dto.getUploadImgMaxNumber());
		return 1;
	}

	@Override
	public MemberGroup selectCheck(MemberGroupVo vo) throws Exception {
		return mmDao.selectCheck(vo);
	}

	@Override
	public List<MemberGroup> selectListUploaded(MemberGroupVo vo) throws Exception {
		return mmDao.selectListUploaded(vo);
	}

	@Override
	public MemberGroup selectMember(MemberGroupVo vo) throws Exception {
		return mmDao.selectMember(vo);
	}
	
	
	
	
	
}
