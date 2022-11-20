package com.sgworld.infra.modules.admin.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin/codeGroup/")
public class AdminCodeGroupController {
	
	@Autowired
	AdminCodeGroupServiceImpl service;
	
	public void setSearch(CodeGroupVo vo)throws Exception{
		vo.setShDelNy(vo.getShDelNy() == null ? 1 : vo.getShDelNy());
		vo.setParamsPaging(service.selectOneCount(vo));
	}
	
	@RequestMapping(value="infrCcgList")
	public String infrCcgList(@ModelAttribute("vo") CodeGroupVo vo , Model model) throws Exception {
		setSearch(vo);
		List<CodeGroupDto>list = service.selectList(vo);
		model.addAttribute("list", list);
		return "infra/admin/infrCcg/infrCcgList";
	}
	
	@RequestMapping(value="infrCcgForm")
	public String infrCcgForm() throws Exception {
		return "infra/admin/infrCcg/infrCcgForm";
	}
	
	@RequestMapping(value="infrCcgView")
	public String infrCcgView(@ModelAttribute("vo")CodeGroupVo vo , Model model) throws Exception {
		CodeGroupDto item = service.selectOne(vo);
		model.addAttribute("item", item);
		return "infra/admin/infrCcg/infrCcgView";
	}
	
	//admin ccg등록
	@RequestMapping(value="insert")
	public String insert(CodeGroupDto dto) throws Exception {
		service.insert(dto);
		return "redirect:/admin/codeGroup/infrCcgList";
	}
	
	
}
