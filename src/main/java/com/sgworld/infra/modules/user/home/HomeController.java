package com.sgworld.infra.modules.user.home;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sgworld.infra.modules.user.sgWorld.SgwSerivceImpl;
import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwDto;

@Controller
public class HomeController {
	@Autowired
	HttpSession session;
	private SgwSerivceImpl sgwService;
	@Autowired
	HomeServiceImpl homeSerive;
	
	public void getSss(Model model,SgwDto sgwDto) {
		Object infrMmId = session.getAttribute("infrMmId");
		Object infrMmName = session.getAttribute("infrMmName");
		String infrMmSeq = (String) session.getAttribute("infrMmSeq");
		model.addAttribute("infrMmSeq", infrMmSeq);
		model.addAttribute("infrMmName", infrMmName);
		model.addAttribute("infrMmId", infrMmId);
		
		
		try {
			if(infrMmSeq != null) {
				sgwDto.setInfrMmSeq(infrMmSeq);
				SgwDto findSgwbyMmSeq = sgwService.findSgwbyMmSeq(sgwDto);
				String sessSgw = findSgwbyMmSeq.getRegByMm();
				System.out.println("infrMmSeq != null :: " + (infrMmSeq != null));
				if(sessSgw != null) {
					System.out.println("sessSgw != null :: " + (sessSgw != null));
					System.out.println("sessSgw :: "+sessSgw);
					System.out.println("infrMmSeq :: "+infrMmSeq);
					model.addAttribute("sessSgw", sessSgw);
				}else {
					System.out.println("sessSgw != null :: " + (sessSgw != null));
					model.addAttribute("sessSgw", null);
				}
			}else {
				System.out.println("infrMmSeq != null :: " + (infrMmSeq != null));
				model.addAttribute("sessSgw", null);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//메인페이지
	@RequestMapping(value="/")
	public String home(SgwDto sgwDto,Model model)throws Exception {
		
		List<SgwDto> sgwList = homeSerive.selectSgwList(sgwDto);
		model.addAttribute("sgwList", sgwList);
		
		getSss(model,sgwDto);
		return "infra/user/modules/home/home";
	}
	//로그인 화면
	@RequestMapping(value="userLogin")
	public String userLogin() {
		return "infra/user/modules/home/userLogin";
	}
	//회원가입
	@RequestMapping(value="userSignIn")
	public String userSignIn() {
		return "infra/user/modules/home/userSignIn";
	}
	
	//가입선택
	@RequestMapping(value="userSignInChoice")
	public String userSignInChoice() {
		return "infra/user/modules/home/userSignInChoice";
	}
}
