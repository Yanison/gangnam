package com.sgworld.infra.modules.user.sgWorld.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sgworld.infra.modules.user.sgWorld.SgwSerivceImpl;
import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwChat;
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
		SgwDto selectSgwOne = sgwService.findSgwbyMmSeq(sgwDto);
		this.template.convertAndSend("/topic/createSgworldDiv", selectSgwOne);
	}
	
	 @MessageMapping(value = "/sgWorld/chatroom/{endPoint}")
	  public void enter(@PathVariable String endPoint,SgwChat msg,SgwDto sgwDto)throws Exception {
		 msg.setChatMsg(msg.getInfrMmSeq() + "님이 채팅방에 참여하였습니다.");
	     template.convertAndSend("/topic/sgWorld/chatroom/" + endPoint, msg);
	 }
	 
	 @MessageMapping(value = "/sgWorld/msgTo/{endPoint}/")
	  public void msg(
			  SgwChat msg,
			  SgwDto sgwDto)throws Exception {
		
		 System.out.println("endPoint :: " + msg.getEndPoint());
		 System.out.println(msg.getChatMsg());
		 
	     template.convertAndSend("/topic/sgWorld/sendMessage/" + msg.getEndPoint(), msg.getChatMsg());
	 }
}