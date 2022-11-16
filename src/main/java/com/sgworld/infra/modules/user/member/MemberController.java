package com.sgworld.infra.modules.user.member;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sgworld.infra.modules.admin.membergroup.MemberGroup;
import com.sgworld.infra.modules.admin.membergroup.MemberGroupServiceImpl;
import com.sgworld.infra.modules.admin.membergroup.MemberGroupVo;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {
	
	@Autowired
	MemberGroupServiceImpl service;
	
	@Autowired
	HttpSession session;
	
	//내 정보 보기
	@RequestMapping(value="memberView")
	public String memberView(@ModelAttribute("vo") MemberGroupVo vo , Model model)throws Exception {
		Object infrMmId = session.getAttribute("infrMmId");
		Object infrMmName = session.getAttribute("infrMmName");
		Object infrMmSeq = session.getAttribute("infrMmSeq");
		model.addAttribute("infrMmSeq", infrMmSeq);
		model.addAttribute("infrMmName", infrMmName);
		model.addAttribute("infrMmId", infrMmId);
		
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
	
	//내정보_아바타 수정
	@RequestMapping(value="memberAvartar")
	public String memberAvartar()throws Exception {
		return "infra/user/modules/member/memberAvartar";
	}
		
	//내정보_내 글 조회
	@RequestMapping(value="memberPostComment")
	public String memberPostComment(@ModelAttribute("vo") MemberGroupVo vo , Model model)throws Exception {
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
	public String ueleteMm(MemberGroup dto)throws Exception {
		service.ueleteMm(dto);
		return "";
	}
	
	//아이디/비번 찾기
	@RequestMapping(value="findMyLogin")
	public String findUser() {
		return "infra/user/modules/home/findMyLogin";
	}

}
