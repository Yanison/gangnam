package com.sgworld.infra.modules.admin.board;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping(value="/admin/board/")
public class AdminBoardController {

	@Autowired
	AdminBoardServiceImpl service;
	
	@RequestMapping(value="infrBdList")
	public String infrBdList(@ModelAttribute("vo") AdminBoardVo vo, Model model) throws Exception {
		
		vo.setParamsPaging(service.selectOneCount(vo));
		
		List<AdminBoardDto> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "infra/admin/infrBd/infrBdList";
	}
	
	@RequestMapping(value="infrBdForm")
	public String infrBdForm() throws Exception {
		return "infra/admin/infrBd/infrBdForm";
	}
	
	@RequestMapping(value="infrBdView")
	public String infrBdView(@ModelAttribute("vo") AdminBoardVo vo, Model model) throws Exception {
		
		AdminBoardDto item = service.selectOne(vo);
		model.addAttribute("item", item);
		model.addAttribute("listUploaded", service.selectListUploaded(vo));
		return "infra/admin/infrBd/infrBdView";
	}
	
	@SuppressWarnings(value = {"all"})
	@RequestMapping(value = "infrBdInst")
	public String infrBdInst(AdminBoardVo vo, AdminBoardDto dto, RedirectAttributes redirectAttributes) throws Exception {
		
		System.out.println("bdDiv: " + dto.getBdDiv());
		System.out.println("bdTitle: " + dto.getBdTitle());
		System.out.println("bdContent: " + dto.getBdContent());
		
		service.insert(dto);
		vo.setBdSeq(dto.getBdSeq());
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/admin/board/infrBdList";
	}
	
	@RequestMapping(value = "infrBdUpdt")
	public String infrBdUpdt(AdminBoardVo vo, AdminBoardDto dto, RedirectAttributes redirectAttributes) throws Exception {
		service.update(dto);
		return "redirect:/admin/board/infrBdList";
	}
	
	@RequestMapping(value = "infrBdUele")
	public String infrBdUele(AdminBoardVo vo, AdminBoardDto dto, RedirectAttributes redirectAttributes) throws Exception {
		service.uelete(dto);
		return "redirect:/admin/board/infrBdList";
	}
	
	@RequestMapping(value = "infrBdDele")
	public String infrBdDele(AdminBoardVo vo, RedirectAttributes redirectAttributes) throws Exception {
		service.delete(vo);
		return "redirect:/admin/board/infrBdList";
	}
	
	
}
