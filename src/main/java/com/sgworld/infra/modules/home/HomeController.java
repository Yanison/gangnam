package com.sgworld.infra.modules.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping(value="/")
	public String home() {
		return "infra/user/modules/home/home";
	}
	
	@RequestMapping(value="/userLogin")
	public String userLogin() {
		return "infra/user/modules/home/userLogin";
	}
	
	@RequestMapping(value="/userSignInChoice")
	public String userSignInChoice() {
		return "infra/user/modules/home/userSignInChoice";
	}
	
	@RequestMapping(value="/userSignIn")
	public String userSignIn() {
		return "infra/user/modules/home/userSignIn";
	}
	
	@RequestMapping(value="/findMyLogin")
	public String findUser() {
		return "infra/user/modules/home/findMyLogin";
	}
	
	@RequestMapping(value="/sgWorld")
	public String sgWorld() {
		return "infra/user/modules/sgWorld/sgWorld";
	}
	
	@RequestMapping(value="/boardList")
	public String boardList() {
		return "infra/user/modules/board/boardHome";
	}
	
}
