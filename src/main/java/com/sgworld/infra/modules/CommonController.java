package com.sgworld.infra.modules;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {
	
	@RequestMapping("choose")
	public String choose() {
		return "choose";
	}

}
