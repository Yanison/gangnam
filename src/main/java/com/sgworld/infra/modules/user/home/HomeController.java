package com.sgworld.infra.modules.user.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	//메인페이지
	@RequestMapping(value="/")
	public String home() {
		return "infra/user/modules/home/home";
	}
	
	
	
	
	
	
	
	
	
	
}
