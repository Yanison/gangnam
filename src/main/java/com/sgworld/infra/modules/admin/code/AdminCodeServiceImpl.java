package com.sgworld.infra.modules.admin.code;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminCodeServiceImpl implements AdminCodeService {
	
	@Autowired
	AdminCodeDao dao;

	
	@PostConstruct
	public void selectListCachedCodeArrayList() throws Exception {
		List<CodeDto> codeListFromDb = (ArrayList<CodeDto>) dao.selectListCachedCodeArrayList();
//		codeListFromDb = (ArrayList<Code>) dao.selectListCachedCodeArrayList();
		CodeDto.cachedCodeArrayList.clear(); 
		CodeDto.cachedCodeArrayList.addAll(codeListFromDb);
		System.out.println("cachedCodeArrayList: " + CodeDto.cachedCodeArrayList.size() + " chached !");
	}

	public static List<CodeDto> selectListCachedCode(String infrCcgSeq) throws Exception {
		List<CodeDto> rt = new ArrayList<CodeDto>();
		for(CodeDto codeRow : CodeDto.cachedCodeArrayList) {
			if (codeRow.getInfrCcgSeq().equals(infrCcgSeq)) {
				rt.add(codeRow);
			} else {
				// by pass
			}
		}
		return rt;
	}
	

	public static String selectOneCachedCode(int codeDto) throws Exception {
		String rt = "";
		for(CodeDto codeRow : CodeDto.cachedCodeArrayList) {
			if (codeRow.getInfrCcSeq().equals(Integer.toString(codeDto))) {
				rt = codeRow.getInfrCcNameKor();
			} else {
				// by pass
			}
		}
		return rt;
	}
	
	
	public static void clear() throws Exception {
		CodeDto.cachedCodeArrayList.clear();
	}

	@Override
	public List<CodeDto> selectList(CodeVo vo) throws Exception {
		return dao.selectList(vo);
	}

	@Override
	public int selectOneCount(CodeVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}

	@Override
	public int insert(CodeDto dto) throws Exception {
		return dao.insert(dto);
	}

	@Override
	public List<CodeDto> viewList() throws Exception {
		return dao.viewList();
	}

	@Override
	public CodeDto selectOne(CodeVo vo) throws Exception {
		return dao.selectOne(vo);
	}
	
	
	
	
	
}
