package com.sgworld.infra.modules.user.sgWorld;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class SgwRestController {

	@PostMapping(value="buildSgw")
	public String buildSgw() {
		
		return "ok";
	}
}
