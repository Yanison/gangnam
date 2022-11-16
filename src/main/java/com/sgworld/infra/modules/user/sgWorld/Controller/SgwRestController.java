package com.sgworld.infra.modules.user.sgWorld.Controller;

import java.util.Random;

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
		System.out.println(
				"SgwRestController.buildSgw() sgworld 개설 요청을 받았습니다. 고유 url 생성을 시작합니다."
				);
		String randStringForEndPoint;
		int doesHealreadyMakeSgw = sgwService.doesHealreadyMakeSgw(sgwDto);
		
		if(doesHealreadyMakeSgw == 0 ){
			while(true) {
				int isDupleLink = sgwService.isDupleLink(sgwDto);
				String generateEndpoint = randStringForEndPoint();
				sgwDto.setSgwLink(generateEndpoint);
				if(isDupleLink != 1) {
					System.out.println("SgwRestController.buildSgw() :: "+generateEndpoint+" is not DupleLink! ");
					randStringForEndPoint = generateEndpoint;
					System.out.println("SgwRestController.buildSgw() :: sgworld개설을 위해 서비스로직으로 데이터를 전송합니다. ");
					sgwService.buildSgw(sgwDto);
					break;
				}else {
					System.out.println("SgwRestController.buildSgw() :: "+generateEndpoint+" is DupleLink");
				}
			}
			return randStringForEndPoint;
		}else {
			return "nope";
		}
	}
	
	 public String randStringForEndPoint() {
	    int leftLimit = 48; // numeral '0'
	    int rightLimit = 122; // letter 'z'
	    int targetStringLength = 10;
	    Random random = new Random();
	    String generatedString = random.ints(leftLimit, rightLimit + 1)
	                                   .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
	                                   .limit(targetStringLength)
	                                   .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
	                                   .toString();
	    System.out.println("SgwRestController.randStringForEndPoint()"+generatedString);
	    return generatedString;
	  }
	 
	 
	 @RequestMapping(value="goMySgw")
	 public String goMySgw(SgwDto sgwDto)throws Exception {
		 sgwService.goMySgw(sgwDto);
		 SgwDto mySgwEndpoint = sgwService.goMySgw(sgwDto);
		 
		 System.out.println("SgwRestController.goMySgw():: mySgwEndpoint 는 " + mySgwEndpoint.getSgwLink());
		 if(mySgwEndpoint.getSgwLink() != "") {
			 return mySgwEndpoint.getSgwLink();
		 }else {
			 return "nope";
		 }
		
	 }
}
