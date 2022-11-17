package com.sgworld.infra.modules.user.home;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sgworld.infra.modules.admin.membergroup.MemberGroup;

@Controller
public class HomeController {
	@Autowired
	HttpSession session;
	
	public void getSss(Model model) {
		Object infrMmId = session.getAttribute("infrMmId");
		Object infrMmName = session.getAttribute("infrMmName");
		Object infrMmSeq = session.getAttribute("infrMmSeq");
		model.addAttribute("infrMmSeq", infrMmSeq);
		model.addAttribute("infrMmName", infrMmName);
		model.addAttribute("infrMmId", infrMmId);
	}
	
	//메인페이지
	@RequestMapping(value="/")
	public String home(Model model , HttpSession httpSession) {
		
		getSss(model);
		return "infra/user/modules/home/home";
	}
	
	//매타버스 실행
	@RequestMapping(value="sgWorld")
	public String sgWorld() {
		return "infra/user/modules/sgWorld/sgWorld";
	}
	//로그인 화면
	@RequestMapping(value="userLogin")
	public String userLogin() {
		return "infra/user/modules/home/userLogin";
	}
	//회원가입
	@RequestMapping(value="userSignIn")
	public String userSignIn() {
		return "infra/user/modules/home/userSignIn";
	}
	
	//가입선택
	@RequestMapping(value="userSignInChoice")
	public String userSignInChoice() {
		return "infra/user/modules/home/userSignInChoice";
	}
}
