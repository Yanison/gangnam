package com.sgworld.infra.modules.admin.membergroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping(value = "/admin/memberGroup/")
public class MemberGroupController {
	
	@Autowired
	MemberGroupServiceImpl service;
	
	//회원관리 리스트
	@RequestMapping(value = "infrMmList")
	public String infrCcList(@ModelAttribute("dto") MemberGroup dto , Model model) throws Exception {
		List<MemberGroup>list = service.selectMmList(dto);
		model.addAttribute("list", list);
		return "infra/admin/infrMm/infrMmList";
	}
	
	//회원관리 등록폼 가기
	@RequestMapping(value = "infrMmForm")
	public String infrCcList() throws Exception {
		return "infra/admin/infrMm/infrMmForm";
	}
	
	//회원관리 등록하기
	@RequestMapping(value = "infrMmInsert")
	public String insertMmSignIn(MemberGroup dto , RedirectAttributes redirectAttributes)throws Exception{
		service.insertMmSignIn(dto);
		return "redirect:/admin/memberGroup/infrMmList";
	}
	
}