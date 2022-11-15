package com.sgworld.infra.modules.user.sgWorld.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sgworld.infra.modules.user.sgWorld.SgwSerivceImpl;
import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwDto;


@RestController
@RequestMapping(value="/sgwrold/")
public class SgwRestController {
	@Autowired
	SgwSerivceImpl sgwService;

	@PostMapping(value="buildSgw")
	public String buildSgw(SgwDto sgwDto)throws Exception {
		System.out.println("SgwRestController.buildSgw() :: shWorld 방 개설 요청을 받았습니다.");
		sgwService.buildSgw(sgwDto);
		
		return "ok";
	}
}
