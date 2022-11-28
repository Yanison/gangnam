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

	//매타버스 실행
	@GetMapping("join/{endPoint}")
	public String sgWorld(
			@PathVariable("endPoint") String endPoint,
			SgwDto sgwDto,
			SgwVo sgwVo,
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
		SgwDto onLoadInfoSgw = sgwService.onLoadInfoSgw(sgwDto);
		SgwDto onLoadUserInfoSgw = sgwService.onLoadUserInfoSgw(sgwDto);
		model.addAttribute("onLoadInfoSgw", onLoadInfoSgw);
		model.addAttribute("onLoadUserInfoSgw", onLoadUserInfoSgw);
		
		
		
		/*
		  * 방장이 들어오면 방의 활성화 여부를 결정함.
		  * 활성화 여부는 세션값으로 남김. 
		  */
		 if(onLoadInfoSgw.getRegByMm() != null) {
			 sgwVo.setOnLiveNy(1);
			 session.setAttribute("onliveNy", sgwVo.getOnLiveNy());
		 }else {
			 sgwVo.setOnLiveNy(0);
			 session.invalidate();
		 }
		 session.getAttribute("onliveNy");
		 model.addAttribute("onliveNy", sgwVo.getOnLiveNy());
		
		return "infra/user/modules/sgWorld/sgWorld";
	}
}
