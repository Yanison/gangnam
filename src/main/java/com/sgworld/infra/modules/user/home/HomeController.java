

package com.sgworld.infra.modules.user.home;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sgworld.infra.modules.admin.board.AdminBoardDto;
import com.sgworld.infra.modules.admin.board.AdminBoardServiceImpl;
import com.sgworld.infra.modules.admin.board.AdminBoardVo;
import com.sgworld.infra.modules.user.sgWorld.SgwSerivceImpl;
import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwDto;

@Controller
public class HomeController {
	@Autowired
	HttpSession session;
	@Autowired
	SgwSerivceImpl sgwService;
	@Autowired
	HomeServiceImpl homeSerive;
	@Autowired
	AdminBoardServiceImpl bdService;
	
	public void getSss(Model model,SgwDto sgwDto) {
		Object infrMmId = session.getAttribute("infrMmId");
		Object infrMmName = session.getAttribute("infrMmName");
		String infrMmSeq = (String) session.getAttribute("infrMmSeq");
		Object infrMmNickname = session.getAttribute("infrMmNickname");
		model.addAttribute("infrMmSeq", infrMmSeq);
		model.addAttribute("infrMmName", infrMmName);
		model.addAttribute("infrMmName", infrMmNickname);
		model.addAttribute("infrMmId", infrMmId);
		
		try {
			if(infrMmSeq != null) {
				sgwDto.setInfrMmSeq(infrMmSeq);
				String sessSgw = sgwService.findSgwbyMmSeq(sgwDto).getRegByMm();
				System.out.println("sessSgw ::" + sessSgw);
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
	
	//???????????????
	@RequestMapping(value="/")
	public String home(SgwDto sgwDto,Model model,AdminBoardVo vo)throws Exception {
		
		getSss(model,sgwDto);
		
		List<SgwDto> sgwList = homeSerive.selectSgwList(sgwDto);
		model.addAttribute("sgwList", sgwList);
		
		List<AdminBoardDto> bdList = bdService.selectList(vo);
		model.addAttribute("bdList", bdList);
		
		
		return "infra/user/modules/home/home";
	}
	//????????? ??????
	@RequestMapping(value="userLogin")
	public String userLogin() {
		return "infra/user/modules/home/userLogin";
	}
	//????????????
	@RequestMapping(value="userSignIn")
	public String userSignIn() {
		return "infra/user/modules/home/userSignIn";
	}
	
	//????????????
	@RequestMapping(value="userSignInChoice")
	public String userSignInChoice() {
		return "infra/user/modules/home/userSignInChoice";
	}
}
