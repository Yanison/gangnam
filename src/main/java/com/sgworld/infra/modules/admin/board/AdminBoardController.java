package com.sgworld.infra.modules.admin.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String infrBdView() throws Exception {
		return "infra/admin/infrBd/infrBdView";
	}
}
