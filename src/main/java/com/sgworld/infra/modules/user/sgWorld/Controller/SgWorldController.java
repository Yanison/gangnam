package com.sgworld.infra.modules.user.sgWorld.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sgworld.infra.modules.user.sgWorld.SgwSerivceImpl;
import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwDto;
import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwVo;

@Controller
@RequestMapping(value = "/sgWorld/")
public class SgWorldController {
	
	@Autowired
	SgwSerivceImpl sgwService;
	@Autowired
	SgwWSController sgwWSController;
	
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
			Model model,
			HttpSession session)throws Exception {
		
		String infrMmSeq = (String) session.getAttribute("infrMmSeq");
		System.out.println("this endPoint is ::" + endPoint);
		System.out.println("this MmSess is ::" + infrMmSeq);
		model.addAttribute("infrMmSeq",infrMmSeq);
		model.addAttribute("endPoint",endPoint);
		
		/*
		 * 페이지 온로드시 클라이언트로 전달될 정보들
		 */
		sgwDto.setSgwLink(endPoint);
		SgwDto onLoadInfoSgw = sgwService.onLoadInfoSgw(sgwDto);
		model.addAttribute("onLoadInfoSgw", onLoadInfoSgw);
		
		System.out.println("manInCharge :: " + onLoadInfoSgw.getRegByMm());
		setOnliveNy(sgwDto,session,model,onLoadInfoSgw.getRegByMm(),endPoint);
		
		sgwDto.setInfrMmSeq(infrMmSeq);
		SgwDto onLoadUserInfoSgw = sgwService.onLoadUserInfoSgw(sgwDto);
		System.out.println(onLoadUserInfoSgw.getInfrMmNickname()+ "님이 입장합니다. :: ");
		sgwWSController.requestAvatar(onLoadUserInfoSgw, endPoint);
		/*
		  * 방장이 들어오면 방의 활성화 여부를 결정함.
		  * 활성화 여부는 세션값으로 남김. 
		  */
		
		
		
		
		return "infra/user/modules/sgWorld/sgWorld";
	}
	
	
	
	
	
}



