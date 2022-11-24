package com.sgworld.infra.modules.user.sgWorld.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sgworld.infra.modules.user.sgWorld.SgwSerivceImpl;
import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwDto;

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
			Model model,
			HttpSession session)throws Exception {
		
		String infrMmSeq = (String) session.getAttribute("infrMmSeq");
		System.out.println("this endPoint is ::" + endPoint);
		System.out.println("this MmSess is ::" + infrMmSeq);
		model.addAttribute("infrMmSeq",infrMmSeq);
		model.addAttribute("endPoint",endPoint);
		
		return "infra/user/modules/sgWorld/sgWorld";
	}
}
