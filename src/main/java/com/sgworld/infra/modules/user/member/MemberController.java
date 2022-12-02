package com.sgworld.infra.modules.user.member;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sgworld.infra.modules.admin.avatar.AdminAvatarServiceImpl;
import com.sgworld.infra.modules.admin.membergroup.MemberGroup;
import com.sgworld.infra.modules.admin.membergroup.MemberGroupServiceImpl;
import com.sgworld.infra.modules.admin.membergroup.MemberGroupVo;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {
	
	@Autowired
	MemberGroupServiceImpl service;
	
	@Autowired
	AdminAvatarServiceImpl servicee;
	

	@Autowired
	HttpSession session;
	
	//내 정보 보기
	@RequestMapping(value="memberView")
	public String memberView(@ModelAttribute("vo") MemberGroupVo vo , Model model)throws Exception {
		
		MemberGroup item = service.selectMmOne(vo);
		model.addAttribute("item", item);
		return "infra/user/modules/member/memberView";
	}
	
	//내 정보 보기_정보 수정
	@RequestMapping(value = "memberUpdt")
	public String udptMmifo(MemberGroup dto , MemberGroupVo vo, RedirectAttributes redirectAttributes)throws Exception{
		service.userUpdate(dto);
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/member/memberView";
	}
	
	//내정보_아바타 수정 화면가기
	@RequestMapping(value="memberAvartar")
	public String memberAvartar(@ModelAttribute("vo") MemberGroupVo vo, Model model)throws Exception {
		MemberGroup item = service.selectCheck(vo);
		model.addAttribute("item",item);
		model.addAttribute("listUploaded", service.selectListUploaded(vo));
		return "infra/user/modules/member/memberAvartar";
	}
	
	//내정보_아바타 이미지 등록
	@SuppressWarnings(value = {"all"})
	@RequestMapping(value = "avatarInst")
	public String memberAvatarInst(@ModelAttribute("vo") MemberGroupVo vo,MemberGroup dto, RedirectAttributes redirectAttributes) throws Exception {
		service.memberInst(dto);
		vo.setInfrMmSeq(dto.getInfrMmSeq());
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/member/memberAvartar";
	}
	
	//내정보_아바타 이미지 변경
	@RequestMapping(value = "avatarUpload")
	public String memberAvatarUpdt(@ModelAttribute("vo")MemberGroupVo vo,MemberGroup dto,RedirectAttributes redirectAttributes)throws Exception{
		service.memberUploaded(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/member/memberAvartar";
	}
		
	//내정보_내 글 조회
	@RequestMapping(value="memberPostComment")
	public String memberPostComment(@ModelAttribute("vo") MemberGroupVo vo , Model model)throws Exception {
		
		vo.setParamsPaging(service.selectCount(vo));
		List<MemberGroup>list = service.selectListBoard(vo);
		model.addAttribute("list", list);
		
		return "infra/user/modules/member/memberPostComment";
	}	
		
	//내정보_회원탈퇴하기
	@RequestMapping(value="memberWithdraw")
	public String memberWithdraw()throws Exception {

		return "infra/user/modules/member/memberWithdraw";
	}
	
	// user,admin 회원탈퇴 실행 이거 좀더 고민해봐야겠습니다
	@RequestMapping(value = "ueleteMm")
	public String ueleteMm(MemberGroup dto , RedirectAttributes redirectAttributes)throws Exception {
		service.ueleteMm(dto);
		session.invalidate();
		return "redirect:/";
	}
	
	//아이디/비번 찾기
	@RequestMapping(value="findMyLogin")
	public String findUser() {
		return "infra/user/modules/home/findMyLogin";
	}
	


}
