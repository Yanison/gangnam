package com.sgworld.infra.modules.user.sgWorld.Controller;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sgworld.infra.modules.user.sgWorld.SgwSerivceImpl;
import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwDto;


@RestController
@RequestMapping(value="/sgWorld/")
public class SgwRestController {
	@Autowired
	SgwSerivceImpl sgwService;

	@GetMapping(value="buildSgw")
	public String buildSgw(SgwDto sgwDto,HttpSession session)throws Exception {
		System.out.println("SgwRestController.buildSgw()");
		
		System.out.println(
				"SgwRestController.buildSgw() sgworld 개설 요청을 받았습니다. 고유 url 생성을 시작합니다."+sgwDto.getInfrMmSeq()
				);
		
		String randStringForEndPoint;
		int doesHeAlreadyMakeSgw = sgwService.doesHeAlreadyMakeSgw(sgwDto);
		
		if(doesHeAlreadyMakeSgw == 0 ){
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
	
	@GetMapping(value="findSgwbyMmSeq")
	public HashMap<String, String> findSgwbyMmSeq(SgwDto sgwDto)throws Exception {
		SgwDto findSgwbyMmSeq = sgwService.findSgwbyMmSeq(sgwDto);
		
		HashMap<String,String> rp = new HashMap<String,String>();
		rp.put("sgwLink", findSgwbyMmSeq.getSgwLink());
		rp.put("infrMmSeq", findSgwbyMmSeq.getRegByMm());
		rp.put("sgwTitle", findSgwbyMmSeq.getSgwTitle());
		
		return rp;
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
	 
	 @GetMapping(value="findMm")
	 @ResponseBody
	 public SgwDto findMm(SgwDto sgwDto)throws Exception {
		 System.out.println("멤버 정보를 찾아옵니다. 찾을 대상 시퀀스 :: " + sgwDto.getInfrMmSeq());
		 
		 SgwDto findMm = sgwService.findMm(sgwDto);
		 
		 return findMm;
	 }
}
