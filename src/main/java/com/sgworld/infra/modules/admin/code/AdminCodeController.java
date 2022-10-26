package com.sgworld.infra.modules.admin.code;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin/code/")
public class AdminCodeController {

	@RequestMapping(value="infrCcList")
	public String infrCcList() throws Exception {
		return "infra/admin/infrCc/infrCcList";
	}
	
	@RequestMapping(value="infrCcForm")
	public String infrCcForm() throws Exception {
		return "infra/admin/infrCc/infrCcForm";
	}
	
	@RequestMapping(value="infrCcView")
	public String infrCcView() throws Exception {
		return "infra/admin/infrCc/infrCcView";
	}
}
