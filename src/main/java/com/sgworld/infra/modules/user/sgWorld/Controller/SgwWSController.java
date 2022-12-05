package com.sgworld.infra.modules.user.sgWorld.Controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

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


@Controller
public class SgwWSController {
	@Autowired
	SgwSerivceImpl sgwService;
	private HttpSession session;
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
		 System.out.println("endPoint :: " + endPoint);
		 System.out.println("msg.getChatMsg() :: "+msg.getChatMsg());
		 
		 Date nowDate = new Date();
		 SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm:ss");
		 String datetime = simpleDateFormat.format(nowDate);
		 
		 HashMap<String,String> chatInfo = new HashMap<String,String>();
		 chatInfo.put("chatMsg", msg.getChatMsg());
		 chatInfo.put("infrNickname", msg.getInfrMmNickname());
		 chatInfo.put("datetime", datetime);
		 chatInfo.put("infrMmSeq", msg.getInfrMmSeq());
		 System.out.println(chatInfo);
	     template.convertAndSend("/topic/sgWorld/sendMessage/" + endPoint, chatInfo);
	 }
	 
	 @MessageMapping(value = "/sgWorld/msgTo/{endPoint}/requestOnloadInfo")
	 public void requestOnloadInfo( @DestinationVariable String endPoint,SgwChat sgwChat)throws Exception {
		 System.out.println("msg :: "+sgwChat.getSgwseq() +" // "+ sgwChat.getInfrMmSeq());
		
		 //SgwChat user = sgwService.findRoomMmOne(sgwChat);
		 //template.convertAndSend("/topic/sgWorld/requestOnloadInfo/"+endPoint, user);
		 
		 sgwChat.setEndPoint(endPoint);
		 List<SgwChat> userList = sgwService.findRoomMm(sgwChat);
		 template.convertAndSend("/topic/sgWorld/"+endPoint+"/avatarWSControll/reRenderingUsers", userList);
	 }
	/*
	 * 유저를 연결시켜주고 끝이 아니다. 실시시간으로 유저의 좌표를 서버와 통신받고 웹소켓 서버에 연결된 유저들에게 공유가되어야한다.
	 */
	 @MessageMapping(value="/sgWorld/{endPoint}/avatarWSControll/updateLoca")
	 public synchronized void avatarWSControll(@DestinationVariable String endPoint,SgwChat sgwChat) {
		 
		 template.convertAndSend("/topic/sgWorld/"+endPoint+"/avatarWSControll/update",sgwChat);
	 }
	 
	 @MessageMapping(value="/sgWorld/{endPoint}/avatarWSControll/leave")
	 public void leaveTheRoom(@DestinationVariable String endPoint,SgwChat sgwChat,SgwDto sgwDto) {
		 //String leaving = sgwChat.getInfrMmSeq();
		 System.out.println("회원번호 "+ sgwChat.getInfrMmSeq()+"번 "+sgwChat.getInfrMmNickname()+" 님이 " +endPoint+ "방을 나갑니다.");
		 try {
			 int deleteMm = sgwService.deleteRoomUser(sgwChat);
			 template.convertAndSend("/topic/sgWorld/"+endPoint+"/avatarWSControll/leave",deleteMm);
			
//			 if(leaving ==  sgwService.onLoadInfoSgw(sgwDto).getRegByMm()) {
//				 
//			 }
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 }
}
