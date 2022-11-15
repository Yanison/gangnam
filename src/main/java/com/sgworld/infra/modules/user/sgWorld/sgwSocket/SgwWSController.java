package com.sgworld.infra.modules.user.sgWorld.sgwSocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class SgwWSController {
	
	private SimpMessagingTemplate template;
	
	@Autowired
	public SgwWSController(SimpMessagingTemplate template) {
		this.template = template;
		System.out.println("ExchangeController :: ExchangeController");
	}
	
	public void createSgworldDiv() {
		
	}
}
