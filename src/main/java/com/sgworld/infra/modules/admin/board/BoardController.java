package com.sgworld.infra.modules.admin.board;

import org.springframework.web.bind.annotation.RequestMapping;

public class BoardController {

	@RequestMapping(value="/infrBdList")
	public String infrBdList() {
		return "infra/admin/infrBd/infrBdList";
	}
	
	@RequestMapping(value="/infrBdForm")
	public String infrBdForm() {
		return "infra/admin/infrBd/infrBdForm";
	}
	
	@RequestMapping(value="/infrBdView")
	public String infrBdView() {
		return "infra/admin/infrBd/infrBdView";
	}
}
