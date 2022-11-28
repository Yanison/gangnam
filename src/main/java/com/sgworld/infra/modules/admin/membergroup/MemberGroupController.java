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

	public void setSearch(MemberGroupVo vo) throws Exception {
		vo.setShDelNy(vo.getShDelNy() == null ? 1 : vo.getShDelNy());
		vo.setParamsPaging(service.selectOneCount(vo));
	}

	// 회원관리 리스트
	@RequestMapping(value = "infrMmList")
	public String infrCcList(@ModelAttribute("vo") MemberGroupVo vo, Model model) throws Exception {
		setSearch(vo);
		List<MemberGroup> list = service.selectMmList(vo);
		model.addAttribute("list", list);
		return "infra/admin/infrMm/infrMmList";
	}

	// 회원관리 등록폼 가기
	@RequestMapping(value = "infrMmForm")
	public String infrCcList() throws Exception {
		return "infra/admin/infrMm/infrMmForm";
	}

	// 회원관리 등록하기
	@RequestMapping(value = "infrMmInsert")
	public String insertMmSignIn(MemberGroup dto, RedirectAttributes redirectAttributes) throws Exception {
		service.insertMmSignIn(dto);
		return "redirect:/admin/memberGroup/infrMmList";
	}

	// 회원관리 상세화면
	@RequestMapping(value = "infrMmView")
	public String selectMmOne(@ModelAttribute("vo") MemberGroupVo vo, Model model) throws Exception {
		MemberGroup item = service.selectMmOne(vo);
		model.addAttribute("item", item);
		return "infra/admin/infrMm/infrMmView";
	}

	// 회원정보 수정
	@RequestMapping(value = "update")
	public String adminUpdate(MemberGroup dto, RedirectAttributes redirectAttributes) throws Exception {
		int result = service.adminUpdate(dto);
		System.out.println("컨트롤 result" + result);
		return "redirect:/admin/memberGroup/infrMmList";
	}

	// 회원정보 삭제여부 삭제
	@RequestMapping(value = "uelete")
	public String adminUelete(MemberGroup dto, RedirectAttributes redirectAttributes) throws Exception {
		service.adminUelete(dto);
		return "redirect:/admin/memberGroup/infrMmList";
	}

	// 회원정보 완전 삭제
	@RequestMapping(value = "delete")
	public String adminDelete(MemberGroupVo vo, RedirectAttributes redirectAttributes) throws Exception {
		service.adminDelete(vo);
		return "redircet:/admin/memberGroup/infrMmList";
	}
	



}
