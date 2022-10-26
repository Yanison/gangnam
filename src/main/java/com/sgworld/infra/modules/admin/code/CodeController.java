package com.sgworld.infra.modules.admin.code;

import org.springframework.web.bind.annotation.RequestMapping;

public class CodeController {

	@RequestMapping(value="/infrCcList")
	public String infrCcList() {
		return "infra/admin/infrCc/infrCcList";
	}
	
	@RequestMapping(value="/infrCcForm")
	public String infrCcForm() {
		return "infra/admin/infrCc/infrCcForm";
	}
	
	@RequestMapping(value="/infrCcView")
	public String infrCcView() {
		return "infra/admin/infrCc/infrCcView";
	}
}
