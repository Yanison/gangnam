package com.sgworld.infra.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {
	
	@RequestMapping(value="userAdmin")
	public String choose() {
		return "firstPage";
	}

}
