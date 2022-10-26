package com.sgworld.infra.modules.admin.codegroup;

import org.springframework.web.bind.annotation.RequestMapping;

public class CodeGroupController {
	
	@RequestMapping(value="/infrCcgList")
	public String infrCcgList() {
		return "infra/admin/infrCcg/infrCcgList";
	}
	
	@RequestMapping(value="/infrCcgForm")
	public String infrCcgForm() {
		return "infra/admin/infrCcg/infrCcgForm";
	}
	
	@RequestMapping(value="/infrCcgView")
	public String infrCcgView() {
		return "infra/admin/infrCcg/infrCcgView";
	}
}
