package com.sgworld.infra.modules.user.sgWorld.Controller;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	
	/*
	 * sgw의 방을 개설합니다. 유저 각 한명당 1개의 방을 만들수 있으며
	 * 유저의 세션값을 매개변수로 받아 검증을 거친 후 방을 개설합니다.
	 * 검증 과정에서 인가를 받으면 개설 정보에 고유 endPoint code 값을 할당 받고 방을 개설하게 됩니다. 
	 */
	@GetMapping(value="buildSgw")
	public String buildSgw(SgwDto sgwDto,HttpSession session)throws Exception {
		System.out.println("SgwRestController.buildSgw()");
		
		System.out.println(
				"SgwRestController.buildSgw() sgworld 개설 요청을 받았습니다. 고유 url 생성을 시작합니다."+sgwDto.getInfrMmSeq()
				);
		
		String randStringForEndPoint;
		int didHeAlreadyMadeSgw = sgwService.didHeAlreadyMadeSgw(sgwDto);
		
		if(didHeAlreadyMadeSgw == 0 ){
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
	
	/*
	 * 방 개설시 각 방마다 할당할 고유 endPoint code 값을 만들어내는 메소드 입니다. 
	 * 고유 endPoint code 값은 랜덤한 10자리의 숫자와 문자의 조합을 만들어냅니다.
	 */
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
	
	//세션에 저장된 유저의 시퀀스로 유저 정보를 찾습니다. 
	@GetMapping(value="findSgwbyMmSeq")
	public HashMap<String, String> findSgwbyMmSeq(SgwDto sgwDto)throws Exception {
		SgwDto findSgwbyMmSeq = sgwService.findSgwbyMmSeq(sgwDto);
		
		HashMap<String,String> rp = new HashMap<String,String>();
		rp.put("sgwLink", findSgwbyMmSeq.getSgwLink());
		rp.put("infrMmSeq", findSgwbyMmSeq.getRegByMm());
		rp.put("sgwTitle", findSgwbyMmSeq.getSgwTitle());
		
		return rp;
	}
	
	 
	 @GetMapping(value="onLoadUserInfoSgw")
	 public SgwDto findMm(SgwDto sgwDto)throws Exception {
		 System.out.println("멤버 정보를 찾아옵니다. 찾을 대상 시퀀스 :: " + sgwDto.getInfrMmSeq());
		 
		 SgwDto findMm = sgwService.findMm(sgwDto);
		 
		 return findMm;
	 }
	 
	 @GetMapping(value="request/join/{endPoint}")
		public String reQuestJoinIntoSgw(
				@PathVariable("endPoint") String endPoint,
				SgwDto sgwDto,
				Model model,
				HttpSession session) {
		try {
			 sgwService.addUserSgwRoom(sgwDto);
		}catch(Exception e){
			e.printStackTrace();
		}
			return "redirect:/join/"+endPoint;
		}
		
}
