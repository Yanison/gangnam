package com.sgworld.infra.modules.admin;

import org.springframework.web.bind.annotation.RequestMapping;

public class HomeController {

	@RequestMapping(value="/adminHome")
	public String adminHome() {
		return "infra/admin/adminHome/adminHome";
	}
}
