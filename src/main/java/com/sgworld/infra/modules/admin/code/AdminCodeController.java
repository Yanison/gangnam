package com.sgworld.infra.modules.admin.code;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value="/admin/code/")
public class AdminCodeController {
	
	@Autowired
	AdminCodeServiceImpl service;

	
	  public void setSearch(CodeVo vo)throws Exception{
	  vo.setShDelNy(vo.getShDelNy() == null ? 1 : vo.getShDelNy());
	  vo.setParamsPaging(service.selectOneCount(vo)); }
	 
	
	@RequestMapping(value="infrCcList")
	public String infrCcList(@ModelAttribute("vo") CodeVo vo, Model model) throws Exception {
		
		setSearch(vo); 
		List<CodeDto>list =service.selectList(vo);
		model.addAttribute("list", list);
		return "infra/admin/infrCc/infrCcList";
	}
	
	@RequestMapping(value="infrCcForm")
	public String infrCcForm(Model model) throws Exception {
		List<CodeDto> view = service.viewList();
		model.addAttribute("view", view);
		return "infra/admin/infrCc/infrCcForm";
	}
	
	@RequestMapping(value="insert")
	public String insert(CodeDto dto) throws Exception {
		service.insert(dto);
		return "redirect:/admin/code/infrCcList";
	}
	
	@RequestMapping(value="infrCcView")
	public String infrCcView(@ModelAttribute("vo") CodeVo vo , Model model) throws Exception {
		
		List<CodeDto> view = service.viewList();
		model.addAttribute("view", view);
		
		CodeDto item = service.selectOne(vo);
		model.addAttribute("item", item);
		return "infra/admin/infrCc/infrCcView";
	}
	
	@RequestMapping(value="update")
	public String update(CodeDto dto) throws Exception {
		service.update(dto);
		return "redirect:/admin/code/infrCcList";
	}
	
	@RequestMapping(value="uelete")
	public String uelete(CodeDto dto) throws Exception {
		service.uelete(dto);
		return "redirect:/admin/code/infrCcList";
	}
	
	@RequestMapping(value="delete")
	public String delete(CodeVo vo) throws Exception {
		service.delete(vo);
		return "redirect:/admin/code/infrCcList";
	}
}
