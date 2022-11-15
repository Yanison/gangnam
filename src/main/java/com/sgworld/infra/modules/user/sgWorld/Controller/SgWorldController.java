package com.sgworld.infra.modules.user.sgWorld.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/sgWorld/")
public class SgWorldController {
	
	//매타버스 실행
	@RequestMapping(value="sgWorld")
	public String sgWorld() {
		return "infra/user/modules/sgWorld/sgWorld";
	}
		
}
