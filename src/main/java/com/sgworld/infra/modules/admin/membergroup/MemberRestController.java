package com.sgworld.infra.modules.admin.membergroup;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value="mmRest")
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
}
