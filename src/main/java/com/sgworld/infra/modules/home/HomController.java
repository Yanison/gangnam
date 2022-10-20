package com.sgworld.infra.modules.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomController {
	
	@RequestMapping(value="/")
	public String home() {
		return "infra/user/modules/home/home";
	}
	
	@RequestMapping(value="/userLogin")
	public String userLogin() {
		return "infra/user/modules/home/userLogin";
	}

}
