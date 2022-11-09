package com.sgworld.infra.modules.admin.sgworld;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.HtmlUtils;


@Controller
@RequestMapping(value="/admin/metaverse/")
public class AdminSgWorldController {

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
	
	@MessageMapping("/hello")
	@SendTo("/topic/greetings")
    public SgWorldDto greeting(SgWorldDto message) throws Exception {
	    Thread.sleep(1000); // simulated delay
	    return new SgWorldDto("Hello, " + HtmlUtils.htmlEscape(message.getSgwChId()) + "!");
    }

}
