package com.sgworld.infra.modules.admin.metaverse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value="/admin/metaverse/")
public class AdminMetaverseController {

	@RequestMapping(value="infrMapList")
	public String infrMapList() throws Exception {
		return "infra/admin/infrMap/infrMapList";
	}
	
	@RequestMapping(value="infrMapForm")
	public String infrMapForm() throws Exception {
		return "infra/admin/infrMap/infrMapForm";
	}
	
	@RequestMapping(value="infrMapView")
	public String infrMapView() throws Exception {
		return "infra/admin/infrMap/infrMapView";
	}

}
