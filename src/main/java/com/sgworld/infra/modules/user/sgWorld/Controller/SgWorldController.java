package com.sgworld.infra.modules.user.sgWorld.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sgworld.infra.modules.user.sgWorld.SgwSerivceImpl;
import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwDto;

@Controller
@RequestMapping(value = "/sgWorld/")
public class SgWorldController {
	
	@Autowired
	SgwSerivceImpl sgwService;
	
	//매타버스 실행
	@GetMapping("sgw/{endPoint}")
	public String sgWorld(@PathVariable("endPoint") String endPoint,SgwDto sgwDto) {
		System.out.println("this endPoint is ::" + endPoint);
		//endPoint 는 고유의 값이니 
		return "infra/user/modules/sgWorld/sgWorld";
	}
}
