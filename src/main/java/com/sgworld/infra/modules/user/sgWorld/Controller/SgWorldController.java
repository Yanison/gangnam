package com.sgworld.infra.modules.user.sgWorld.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sgworld.infra.modules.user.sgWorld.SgwSerivceImpl;
import com.sgworld.infra.modules.user.sgWorld.sgwdto.AvatarControllVo;
import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwChat;
import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwDto;

@Controller
@RequestMapping(value = "/sgWorld/")
public class SgWorldController {
	
	@Autowired
	SgwSerivceImpl sgwService;
	@Autowired
	SgwWSController sgwWSController;
	private SimpMessagingTemplate template;
	
	@Autowired
	public SgWorldController(SimpMessagingTemplate template) {
		this.template = template;
		System.out.println("ExchangeController :: ExchangeController");
	}
	
	private void setOnliveNy(SgwDto sgwDto,HttpSession session,Model model,String manInCharge,String endPoint){
		 
		try {
			if( manInCharge != null) {
				 
				 sgwDto.setOnLiveNy(1);
				 sgwDto.setSgwLink(endPoint);
				 sgwService.onLiveNy(sgwDto);
				 session.setAttribute(endPoint, sgwDto.getOnLiveNy());
			 }else {
				 sgwDto.setOnLiveNy(0);
				 sgwDto.setSgwLink(endPoint);
				 session.invalidate();
			 }
			session.getAttribute(endPoint);
			model.addAttribute(endPoint, sgwDto.getOnLiveNy());
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

	//매타버스 실행
	@GetMapping("join/{endPoint}")
	public String sgWorld(
			@PathVariable("endPoint") String endPoint,
			SgwDto sgwDto,
			SgwChat sgwChat,
			Model model,
			HttpSession session)throws Exception {
		/*
		 * 유저가 입장하면..
		 * 1.유저의 세션을 불러오
		 */
		
		
		/*
		 * 입장한 유저의 세션정보 불러오기
		 */
		String infrMmSeq = (String) session.getAttribute("infrMmSeq");
		String infrMmNickname = (String) session.getAttribute("infrMmNickname");
		System.out.println("this endPoint is ::" + endPoint);
		System.out.println("this MmSess is ::" + infrMmSeq);
		model.addAttribute("infrMmSeq",infrMmSeq);
		model.addAttribute("infrMmNickname",infrMmNickname);
		model.addAttribute("endPoint",endPoint);
		
		/*
		 * 페이지 온로드시 클라이언트로 전달될 방 정보들
		 */
		sgwDto.setSgwLink(endPoint);
		SgwDto onLoadInfoSgw = sgwService.onLoadInfoSgw(sgwDto);
		String sgwSeq = onLoadInfoSgw.getSgwSeq();
		List<SgwDto>userArrList = AvatarControllVo.userArrList;
		userArrList.add(onLoadInfoSgw);
		
		System.out.println("sgwSeq :: "+sgwSeq);
		model.addAttribute("onLoadInfoSgw", onLoadInfoSgw);
		System.out.println("manInCharge :: " + onLoadInfoSgw.getRegByMm());
		setOnliveNy(sgwDto,session,model,onLoadInfoSgw.getRegByMm(),endPoint);
		
		sgwDto.setInfrMmSeq(infrMmSeq);
		sgwDto.setSgwSeq(sgwSeq);
		int findMmRoomOne = sgwService.findMmRoomOne(sgwDto);
		System.out.println("findMmRoomOne :: " + findMmRoomOne);
		 if(findMmRoomOne == 0) {
			 	sgwDto.setSgwSeq(sgwSeq);
			 	sgwDto.setInfrMmSeq(infrMmSeq);
				sgwService.insertRoomUser(sgwDto);
		}else {
			System.out.println("유저 있음");
		}
		 
		/*
		  * 방장이 들어오면 방의 활성화 여부를 결정함.
		  * 활성화 여부는 세션값으로 남김. 
		  */
		return "infra/user/modules/sgWorld/sgWorld2";
	}
	 
}



