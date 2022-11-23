package com.sgworld.infra.modules.admin.avatar;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sgworld.infra.modules.admin.board.AdminBoardDto;
import com.sgworld.infra.modules.admin.board.AdminBoardVo;

@Controller
@RequestMapping(value="/admin/avatar/")
public class AdminAvatarController {

	@Autowired
	AdminAvatarServiceImpl service;
	
	@RequestMapping(value="infrAvatarList")
	public String infrAvatarList(@ModelAttribute("vo") AvatarVo vo, Model model) throws Exception {
		vo.setParamsPaging(service.selectOneCount(vo));
		
		List<AvatarDto> list = service.selectList(vo);
		model.addAttribute("list", list);
		//model.addAttribute("listUploadded", service.selectListUploaded(vo));
		return "infra/admin/infrAvatar/infrAvatarList";
	}
	
	@RequestMapping(value="infrAvatarForm")
	public String infrAvatarForm() throws Exception {
		return "infra/admin/infrAvatar/infrAvatarForm";
	}
	
	@RequestMapping(value="infrAvatarView")
	public String infrAvatarView(@ModelAttribute("vo") AvatarVo vo, Model model) throws Exception {
		
		AvatarDto item = service.selectOne(vo);
		model.addAttribute("item", item);
		model.addAttribute("listUploaded", service.selectListUploaded(vo));
		return "infra/admin/infrAvatar/infrAvatarView";
	}
	
	@SuppressWarnings(value = {"all"})
	@RequestMapping(value = "infrAvatarInst")
	public String infrAvatarInst(AvatarVo vo, AvatarDto dto, RedirectAttributes redirectAttributes) throws Exception {
		System.out.println("까꿍");
		service.insert(dto);
		vo.setAvatarSeq(dto.getAvatarSeq());
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/admin/avatar/infrAvatarList";
	}
	
	@RequestMapping(value = "infrAvatarUpdt")
	public String infrBdUpdt(AvatarVo vo, AvatarDto dto, RedirectAttributes redirectAttributes) throws Exception {
		service.update(dto);
		return "redirect:/admin/avatar/infrAvatarList";
	}
	
	@RequestMapping(value = "infrAvatarUele")
	public String infrBdUele(AvatarVo vo, AvatarDto dto, RedirectAttributes redirectAttributes) throws Exception {
		service.uelete(dto);
		return "redirect:/admin/avatar/infrAvatarList";
	}
	
	@RequestMapping(value = "infrAvatarDele")
	public String infrBdDele(AvatarVo vo, RedirectAttributes redirectAttributes) throws Exception {
		service.delete(vo);
		return "redirect:/admin/avatar/infrAvatarList";
	}
}
