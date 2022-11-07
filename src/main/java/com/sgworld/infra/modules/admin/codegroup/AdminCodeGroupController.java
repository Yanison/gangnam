package com.sgworld.infra.modules.admin.codegroup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin/codeGroup/")
public class AdminCodeGroupController {
	
	@Autowired
	AdminCodeGroupServiceImpl service;
	
	@RequestMapping(value="infrCcgList")
	public String infrCcgList() throws Exception {
		return "infra/admin/infrCcg/infrCcgList";
	}
	
	@RequestMapping(value="infrCcgForm")
	public String infrCcgForm() throws Exception {
		return "infra/admin/infrCcg/infrCcgForm";
	}
	
	@RequestMapping(value="infrCcgView")
	public String infrCcgView() throws Exception {
		return "infra/admin/infrCcg/infrCcgView";
	}
}
