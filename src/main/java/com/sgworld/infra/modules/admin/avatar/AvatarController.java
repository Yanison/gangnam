package com.sgworld.infra.modules.admin.avatar;

import org.springframework.web.bind.annotation.RequestMapping;

public class AvatarController {

	@RequestMapping(value="/infrAvatarList")
	public String infrAvatarList() {
		return "infra/admin/infrAvatar/infrAvatarList";
	}
	
	@RequestMapping(value="/infrAvatarForm")
	public String infrAvatarForm() {
		return "infra/admin/infrAvatar/infrAvatarForm";
	}
	
	@RequestMapping(value="/infrAvatarView")
	public String infrAvatarView() {
		return "infra/admin/infrAvatar/infrAvatarView";
	}
}
