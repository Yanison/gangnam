package com.sgworld.infra.modules.admin.membergroup;

import org.springframework.web.bind.annotation.RequestMapping;

public class MemberGroupController {

	@RequestMapping(value="/infrMmList")
	public String infrMmList() {
		return "infra/admin/infrMm/infrMmList";
	}
	
	@RequestMapping(value="/infrMmForm")
	public String infrMmForm() {
		return "infra/admin/infrMm/infrMmForm";
	}
	
	@RequestMapping(value="/infrMmView")
	public String infrMmView() {
		return "infra/admin/infrMm/infrMmView";
	}
}
