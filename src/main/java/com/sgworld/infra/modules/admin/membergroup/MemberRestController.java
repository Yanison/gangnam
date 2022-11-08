package com.sgworld.infra.modules.admin.membergroup;

import java.util.Random;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sgworld.infra.common.MailService;
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
	@Autowired
	MailService mainService;
	
	@RequestMapping(value="userSignIn")
	public String userSignIn(MemberGroup dto)throws Exception {
		
		int insertMmSignIn = mmService.insertMmSignIn(dto);
		System.out.println("insertMmSignIn :: " + insertMmSignIn);
		
		return "userSignIn";
	}
	
	@RequestMapping(value="userLogin")
	public String userLogin(MemberGroup dto,MemberGroupVo vo,HttpSession session)throws Exception{
		
		MemberGroup user = mmService.selectUserLogin(dto);
		
		if(user.getCount() == 1) {
			
			session.setAttribute("infrMmSeq", user.getInfrMmSeq());
			session.setAttribute("infrMmId", user.getInfrMmId());
			session.setAttribute("infrMmName", user.getInfrMmName());
			Object infrMmSeq = session.getAttribute("infrMmSeq");
			Object infrMmId = session.getAttribute("infrMmId");
			Object infrMmName = session.getAttribute("infrMmName");
			String mmSs = (String) session.getAttribute("infrMmSeq");
			
			vo.setMmSsSeq(mmSs);
			
			System.out.print(
					"userLogin session infrMmSeq ::" + infrMmSeq + "\n "
					+ "userLogin session infrMmId ::" + infrMmId + "\n "
					+ "userLogin session infrMmName ::" + infrMmName + "\n "
					+ "userLogin session infrMmName ::" + infrMmName + "\n "
					);
			return "okay";
		}else {
			return "nope";
		}
		
		
		
		
		

		
	}
	
	@RequestMapping(value="userLogOut")
	public String userLogOut(HttpSession session)throws Exception {
		
		session.invalidate();
		
		return "userLogOut";
	}
	@RequestMapping(value="getValidationOfDuple")
	public int getValidationOfDuple(MemberGroup dto)throws Exception {
		
		int getValidationOfDuple = mmService.isduple(dto);
		
		return getValidationOfDuple;
	}
	
	
	/**
     * 휴대번호 인증
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
       message.setText(
    		   "싸게월드 휴대폰 인증번호 입니다." +
    		   "<br><br>" 
    		   + randNum
    		   );

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
    
    /*
     * 이메일 인증
     */
    @PostMapping(value="getEmailAuthCode")
    public String getEmailAuthCode(SMS email)throws Exception {
    	
    	
    	String infrMmEmail = email.getInfrMmEmail();
    	
    	System.out.println("infrMmEmail :: " + infrMmEmail);
    	
    	if(infrMmEmail != null) {
    		return mainService.sendMailViaSmtpGmail(infrMmEmail);
    	}else {
    		return "fail";
    	}
    	
    }
}
