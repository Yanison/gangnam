package com.sgworld.infra.modules.user.sgWorld.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
	
	@MessageMapping(value="createSgworldDiv")
	public void createSgworldDiv(SgwDto sgwDto)throws Exception {
		SgwDto selectSgwOne = sgwService.findSgwbyMmSeq(sgwDto);
		this.template.convertAndSend("/topic/createSgworldDiv", selectSgwOne);
	}
	@MessageMapping(value="/home/chat")
	public void homeChat(SgwChat sgwChat)throws Exception {
		this.template.convertAndSend("/topic/home/chat", sgwChat);
	}
	@MessageMapping(value="usersNum/{endPoint}")
	public synchronized void usersNum(String num,@DestinationVariable String endPoint)throws Exception {
		
		System.out.println(
				"usersNum :: "+num+ "\n" +
				"endPoint :: "+ endPoint
				);
		HashMap<String,String> usersNum = new HashMap<String,String>();
		usersNum.put("endPoint", endPoint);
		usersNum.put("usersNum",num);
		
		this.template.convertAndSend("/topic/usersNum", usersNum);
	}
	
	 @MessageMapping(value = "/sgWorld/chatroom/{endPoint}")
	  public void enter(@PathVariable String endPoint,SgwChat msg,SgwDto sgwDto)throws Exception {
		 msg.setChatMsg(msg.getInfrMmSeq() + "?????? ???????????? ?????????????????????.");
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
	 public void requestOnloadInfo( @DestinationVariable String endPoint,SgwChat sgwChat,SgwDto sgwDto)throws Exception {
		 System.out.println("msg :: "+sgwChat.getSgwSeq() +" // "+ sgwChat.getInfrMmSeq());
		
		 //SgwChat user = sgwService.findRoomMmOne(sgwChat);
		 //template.convertAndSend("/topic/sgWorld/requestOnloadInfo/"+endPoint, user);
		 
		 sgwChat.setEndPoint(endPoint);
		 List<SgwChat> userList = sgwService.findRoomMm(sgwChat);
		 
		 template.convertAndSend("/topic/sgWorld/"+endPoint+"/avatarWSControll/reRenderingUsers", userList);
	 }
	/*
	 * ????????? ?????????????????? ?????? ?????????. ?????????????????? ????????? ????????? ????????? ???????????? ????????? ????????? ????????? ??????????????? ????????????????????????.
	 */
	 @MessageMapping(value="/sgWorld/{endPoint}/avatarWSControll/updateLoca")
	 public synchronized void avatarWSControll(@DestinationVariable String endPoint,SgwChat sgwChat) {
		 
		 template.convertAndSend("/topic/sgWorld/"+endPoint+"/avatarWSControll/update",sgwChat);
	 }
	 
	 @MessageMapping(value="/sgWorld/{endPoint}/avatarWSControll/leave")
	 public void leaveTheRoom(@DestinationVariable String endPoint,SgwChat sgwChat,SgwDto sgwDto) {
		 String leaving = sgwChat.getInfrMmSeq();
		 System.out.println("???????????? "+ leaving+"??? "+sgwChat.getInfrMmNickname()+" ?????? " +endPoint+"("+sgwChat.getSgwSeq()+")"+ "?????? ????????????.");
		 try {
			 int deleteMm = sgwService.deleteRoomUser(sgwChat);
			 template.convertAndSend("/topic/sgWorld/"+endPoint+"/avatarWSControll/leave",deleteMm);
			
			 sgwDto.setSgwLink(endPoint);
			 SgwDto onLoadInfoSgw = sgwService.onLoadInfoSgw(sgwDto);
			 String regByMm = onLoadInfoSgw.getRegByMm();
			 System.out.println("isRegByMm??"+(leaving == regByMm) + "//getRegByMm :: "+ regByMm+" ,leaving :: "+leaving);
			 
			 if(String.valueOf(leaving) == String.valueOf(regByMm)) {
				 System.out.println("isRegByMm?? " + (leaving == regByMm));
				 sgwDto.setOnLiveNy(0);
				 sgwService.onLiveNy(onLoadInfoSgw);
			 }
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 }
	 
	 
	 
	 /******************
	  ***** WebRTC
	  ******************/
	 @MessageMapping(value="sgWorld/{endPoint}/avatarWSControll/WebRTC/contactListener")
	 public void contactListener(@DestinationVariable String endPoint,String contact) throws ParseException {
		 System.out.println("contactListener :: "+contact);
		 template.convertAndSend("/topic/sgWorld/"+endPoint+"/avatarWSControll/WebRTC/contactListener",contact);
	 }
	 @MessageMapping(value="sgWorld/{endPoint}/avatarWSControll/WebRTC/answer/{to}")
	 public void answer(@DestinationVariable String endPoint,@DestinationVariable String to,String answer) throws ParseException {
		 System.out.println("answer :: " + answer);
		 template.convertAndSend("/topic/sgWorld/"+endPoint+"/avatarWSControll/WebRTC/answer/"+to,answer);
	 }
	 @MessageMapping(value="sgWorld/{endPoint}/avatarWSControll/WebRTC/offer/{to}")
	 public void offer(@DestinationVariable String endPoint,@DestinationVariable String to,String offer) {
		 System.out.println("offer :: " + offer);
		 template.convertAndSend("/topic/sgWorld/"+endPoint+"/avatarWSControll/WebRTC/offer/"+to,offer);
	 }
	 @MessageMapping(value="sgWorld/{endPoint}/avatarWSControll/WebRTC/ice")
	 public void ice(@DestinationVariable String endPoint,String ice) {
		 System.out.println("ice :: " + ice);
		 template.convertAndSend("/topic/sgWorld/"+endPoint+"/avatarWSControll/WebRTC/ice",ice);
	 }
	 
}
