package com.sgworld.infra.modules.admin.membergroup;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin/memberGroup/")
public class MemberGroupController {

	@RequestMapping(value="infrMmList")
	public String infrMmList() throws Exception {
		return "infra/admin/infrMm/infrMmList";
	}
	
	@RequestMapping(value="infrMmForm")
	public String infrMmForm() throws Exception {
		return "infra/admin/infrMm/infrMmForm";
	}
	
	@RequestMapping(value="infrMmView")
	public String infrMmView() throws Exception {
		return "infra/admin/infrMm/infrMmView";
	}
} 
