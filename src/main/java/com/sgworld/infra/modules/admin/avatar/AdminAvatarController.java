package com.sgworld.infra.modules.admin.avatar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin/avatar/")
public class AdminAvatarController {

	@RequestMapping(value="infrAvatarList")
	public String infrAvatarList() throws Exception {
		return "infra/admin/infrAvatar/infrAvatarList";
	}
	
	@RequestMapping(value="infrAvatarForm")
	public String infrAvatarForm() throws Exception {
		return "infra/admin/infrAvatar/infrAvatarForm";
	}
	
	@RequestMapping(value="infrAvatarView")
	public String infrAvatarView() throws Exception {
		return "infra/admin/infrAvatar/infrAvatarView";
	}
}
