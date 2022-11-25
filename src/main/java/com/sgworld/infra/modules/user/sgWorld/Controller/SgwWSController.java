package com.sgworld.infra.modules.user.sgWorld.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sgworld.infra.modules.user.sgWorld.SgwSerivceImpl;
import com.sgworld.infra.modules.user.sgWorld.sgwdto.AvatarControllVo;
import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwChat;
import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwDto;
import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwVo;


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
	 

	 @MessageMapping(value = "/sgWorld/msgTo/{endPoint}")
	  public void msg(
			  @DestinationVariable String endPoint,
			  SgwChat msg,
			  SgwDto sgwDto)throws Exception {
		 System.out.println("endPoint :: " + msg.getEndPoint());
		 System.out.println("msg.getChatMsg() :: "+msg.getChatMsg());
		 
		 Date nowDate = new Date();
		 SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm:ss");
		 String datetime = simpleDateFormat.format(nowDate);
		 
		 HashMap<String,String> chatInfo = new HashMap<String,String>();
		 chatInfo.put("chatMsg", msg.getChatMsg());
		 chatInfo.put("infrNickname", msg.getImfrNickname());
		 chatInfo.put("datetime", datetime);
		 chatInfo.put("infrMmSeq", msg.getInfrMmSeq());
		 
		 
		 
	     template.convertAndSend("/topic/sgWorld/sendMessage/" + endPoint, chatInfo);
	 }
	 
	 public void requestAvatar(SgwDto userInfo,String endPoint) {
		 System.out.println(
				 "유저가 입장합니다. :: "+userInfo.getInfrMmSeq() +"님"+ "\n" +
				 "유저 시퀀스 :: "+userInfo.getInfrMmSeq()+ "\n" +
				 "유저 닉네임 :: "+userInfo.getInfrMmNickname()+ "\n" +
				 "유저 아바타코드 :: "+userInfo.getAvatarSeq()+ "\n" +"\n"
				 );
		 if(userInfo.getInfrMmSeq() != null) {
			 System.out.println("userIdx in not null :: "+userInfo.getInfrMmSeq());
			 template.convertAndSend("/topic/sgWorld/requestAvatar/"+endPoint,userInfo);
		 }
	}
	 
	
	 
	/*
	 * 유저를 연결시켜주고 끝이 아니다. 실시시간으로 유저의 좌표를 서버와 통신받고 웹소켓 서버에 연결된 유저들에게 공유가되어야한다.
	 */
	 @RequestMapping(value="/sgWorld/{endPoint}/avatarWSControll")
	 public void avatarWSControll(@DestinationVariable String endPoint,AvatarControllVo acVo) {
		 
		 template.convertAndSend("/topic/sgWorld/"+endPoint+"/avatarWSControll/",acVo);
	 }
}
