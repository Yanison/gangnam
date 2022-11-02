package com.sgworld.infra.modules.admin.membergroup;

import java.io.File;
import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sgworld.infra.common.SMS;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@RestController
@RequestMapping(value="/member/")
public class MemberRestController {
	
	@Autowired
	MemberGroupServiceImpl mmService;
	
	@RequestMapping(value="userSignIn")
	public String userSignIn(MemberGroup dto)throws Exception {
		
		mmService.insertMmSignIn(dto);
		
		return "userSignIn";
	}
	
	@RequestMapping(value="userLogin")
	public MemberGroup userLogin(MemberGroup dto,MemberGroup vo,HttpSession session)throws Exception{
		
		MemberGroup user = mmService.selectUserLogin(dto);
		
		session.setAttribute("infrMmSeq", user.getInfrMmSeq());
		session.setAttribute("infrMmId", user.getInfrMmId());
		session.setAttribute("infrMmName", user.getInfrMmName());
		Object infrMmSeq = session.getAttribute("infrMmSeq");
		Object infrMmId = session.getAttribute("infrMmId");
		Object infrMmName = session.getAttribute("infrMmName");
		
		System.out.println("userLogin session infrMmSeq ::" + infrMmSeq);
		System.out.println("userLogin session infrMmId ::" + infrMmId);
		System.out.println("userLogin session infrMmName ::" + infrMmName);
		
		return user;
	}
	
	@RequestMapping(value="userLogOut")
	public String userLogOut(HttpSession session)throws Exception {
		
		session.invalidate();
		
		return "userLogOut";
	}
	
	
	/**
     * 단일 메시지 발송 예제
     */
	

	final DefaultMessageService messageService;

   public MemberRestController() {
       this.messageService = NurigoApp.INSTANCE.initialize("NCS0IUZMOI4YCU9A", "D7ORKEGXGV6VPYPNCJHB8EYGXCMMPO3W", "https://api.solapi.com");
   }
   
   public void sendSMS(SMS sms,String randNum) {
	   Message message = new Message();
       // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
       message.setFrom("01031744295");
       message.setTo(sms.getToNum());
       message.setText(randNum);

       SingleMessageSentResponse response 
       	= this.messageService.sendOne(new SingleMessageSendingRequest(message));
       System.out.println(response);
   }
 

    @PostMapping(value="send-one")
    public String sendOne(SMS sms) {
    	
    	Random rand = new Random();
    	String randSMSNumToSend = "";
    	for(int i=0; i < 4; i ++) {
    		String ranNum = Integer.toString(rand.nextInt(10));
    		randSMSNumToSend += ranNum;
    	}
    	
    	sendSMS(sms,randSMSNumToSend);
    	
        return randSMSNumToSend;
    }
}
