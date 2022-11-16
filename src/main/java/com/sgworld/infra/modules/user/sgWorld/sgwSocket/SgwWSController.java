package com.sgworld.infra.modules.user.sgWorld.sgwSocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sgworld.infra.modules.user.sgWorld.SgwSerivceImpl;
import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwDto;

@Controller
public class SgwWSController {
	@Autowired
	SgwSerivceImpl sgwService;
	
	private SimpMessagingTemplate template;
	
	@Autowired
	public SgwWSController(SimpMessagingTemplate template) {
		this.template = template;
		System.out.println("ExchangeController :: ExchangeController");
	}
	
	@RequestMapping(value="createSgworldDiv")
	public void createSgworldDiv(SgwDto sgwDto)throws Exception {
		SgwDto selectSgwOne = sgwService.selectSgwOne(sgwDto);
		this.template.convertAndSend("/topic/createSgworldDiv", selectSgwOne);
	}
}
