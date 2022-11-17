package com.sgworld.infra.modules.user.sgWorld.Controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class SgwWSContorller {
	
	@MessageMapping(value="createSgworldDiv")
	@SendTo(value="createSgworldDiv")
	public String createSgworldDiv() {
		
		return "obj";
	}

}
