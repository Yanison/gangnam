package com.sgworld.infra.modules.admin.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin/board/")
public class AdminBoardController {

	@RequestMapping(value="infrBdList")
	public String infrBdList() throws Exception {
		return "infra/admin/infrBd/infrBdList";
	}
	
	@RequestMapping(value="infrBdForm")
	public String infrBdForm() throws Exception {
		return "infra/admin/infrBd/infrBdForm";
	}
	
	@RequestMapping(value="infrBdView")
	public String infrBdView() throws Exception {
		return "infra/admin/infrBd/infrBdView";
	}
}
