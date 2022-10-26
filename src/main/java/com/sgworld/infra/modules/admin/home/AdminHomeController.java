package com.sgworld.infra.modules.admin.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin/")
public class AdminHomeController {
	
	@RequestMapping(value="adminHome")
	public String adminHome() throws Exception {
		return "infra/admin/adminHome/adminHome";
	}

}
