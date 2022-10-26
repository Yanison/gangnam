package com.sgworld.infra.modules.admin.metaverse;

import org.springframework.web.bind.annotation.RequestMapping;

public class MetaverseController {

	@RequestMapping(value="/infrMapList")
	public String infrMapList() {
		return "infra/admin/infrMap/infrMapList";
	}
	
	@RequestMapping(value="/infrMapForm")
	public String infrMapForm() {
		return "infra/admin/infrMap/infrMapForm";
	}
	
	@RequestMapping(value="/infrMapView")
	public String infrMapView() {
		return "infra/admin/infrMap/infrMapView";
	}

}
