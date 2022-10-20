package com.sgworld.infra.modules.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/member/")
public class HomController {
	
	@RequestMapping(value="/")
	public String home() {
		return "infra/user/modules/home/home";
	}
	
	@RequestMapping(value="userLogin")
	public String userLogin() {
		return "infra/user/modules/home/userLogin";
	}
	
	@RequestMapping(value="boardList")
	public String boardList() {
		return "infra/user/modules/board/boardHome";
	}

}
