package com.sgworld.infra.modules.user.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {
	
	//내 정보 보기
	@RequestMapping(value="memberView")
	public String memberView() {
		return "infra/user/modules/member/memberView";
	}
	
	//내정보_아바타 수정
	@RequestMapping(value="memberAvartar")
	public String memberAvartar() {
		return "infra/user/modules/member/memberAvartar";
	}
		
	//내정보_내 글 조회
	@RequestMapping(value="memberPostComment")
	public String memberPostComment() {
		return "infra/user/modules/member/memberPostComment";
	}	
		
	//내정보_회원탈퇴
	@RequestMapping(value="memberWithdraw")
	public String memberWithdraw() {
		return "infra/user/modules/member/memberWithdraw";
	}	
	
	//로그인 화면
	@RequestMapping(value="userLogin")
	public String userLogin() {
		return "infra/user/modules/home/userLogin";
	}
	
	//가입선택
	@RequestMapping(value="userSignInChoice")
	public String userSignInChoice() {
		return "infra/user/modules/home/userSignInChoice";
	}
	
	//회원가입
	@RequestMapping(value="userSignIn")
	public String userSignIn() {
		return "infra/user/modules/home/userSignIn";
	}
	
	//아이디/비번 찾기
	@RequestMapping(value="findMyLogin")
	public String findUser() {
		return "infra/user/modules/home/findMyLogin";
	}

}
