package com.sgworld.infra.modules.user.member;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sgworld.infra.modules.admin.avatar.AdminAvatarServiceImpl;
import com.sgworld.infra.modules.admin.membergroup.MemberGroup;
import com.sgworld.infra.modules.admin.membergroup.MemberGroupServiceImpl;
import com.sgworld.infra.modules.admin.membergroup.MemberGroupVo;
import com.sgworld.infra.modules.user.sgWorld.SgwSerivceImpl;
import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwDto;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {
	
	@Autowired
	MemberGroupServiceImpl service;
	
	@Autowired
	AdminAvatarServiceImpl servicee;
	
	@Autowired
	HttpSession session;
	@Autowired
	SgwSerivceImpl sgwService;
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
	
	//??? ?????? ??????
	@RequestMapping(value="memberView")
	public String memberView(@ModelAttribute("vo") MemberGroupVo vo , Model model ,SgwDto sgwDto)throws Exception {
		
		getSss(model,sgwDto);
//		String infrMmSeq = (String) session.getAttribute("infrMmSeq");
//		vo.setInfrMmSeq(infrMmSeq);
		System.out.println("mmseq :: "+vo.getInfrMmSeq());
		
		MemberGroup item = service.selectMember(vo);
		
		//System.out.println("mmseq ph"+item.getInfrMmPhone());
		
		model.addAttribute("item", item);
		
		
		return "infra/user/modules/member/memberView";
	}
	
	@RequestMapping(value="rqMemberView/{seq}")
	public MemberGroup rqMemberView(@ModelAttribute("vo") MemberGroupVo vo , Model model ,SgwDto sgwDto,@PathVariable String seq)throws Exception {
		
		System.out.println("mmseq :: "+vo.getInfrMmSeq());
		MemberGroup item = service.selectMember(vo);
		
		System.out.println("mmseq ph"+item.getInfrMmPhone());
		return item;
	}
	
	//??? ?????? ??????_?????? ??????
	@RequestMapping(value = "memberUpdt")
	public String udptMmifo(MemberGroup dto , MemberGroupVo vo, RedirectAttributes redirectAttributes)throws Exception{
		service.userUpdate(dto);
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/member/memberView";
	}
	
	//?????????_????????? ?????? ????????????
	@RequestMapping(value="memberAvartar")
	public String memberAvartar(@ModelAttribute("vo") MemberGroupVo vo, Model model ,SgwDto sgwDto)throws Exception {
		getSss(model,sgwDto);
		MemberGroup item = service.selectCheck(vo);
		model.addAttribute("item",item);
		model.addAttribute("listUploaded", service.selectListUploaded(vo));
		return "infra/user/modules/member/memberAvartar";
	}
	
	//?????????_????????? ????????? ??????
	@SuppressWarnings(value = {"all"})
	@RequestMapping(value = "avatarInst")
	public String memberAvatarInst(@ModelAttribute("vo") MemberGroupVo vo,MemberGroup dto, RedirectAttributes redirectAttributes) throws Exception {
		service.memberInst(dto);
		vo.setInfrMmSeq(dto.getInfrMmSeq());
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/member/memberAvartar";
	}
	
	//?????????_????????? ????????? ??????
	@RequestMapping(value = "avatarUpload")
	public String memberAvatarUpdt(@ModelAttribute("vo")MemberGroupVo vo,MemberGroup dto,RedirectAttributes redirectAttributes)throws Exception{
		service.memberUploaded(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/member/memberAvartar";
	}
		
	//?????????_??? ??? ??????
	@RequestMapping(value="memberPostComment")
	public String memberPostComment(@ModelAttribute("vo") MemberGroupVo vo , Model model ,MemberGroup dto,SgwDto sgwDto)throws Exception {
		getSss(model,sgwDto);
		vo.setParamsPaging(service.selectCount(vo));
		List<MemberGroup>list = service.selectListBoard(vo);
		model.addAttribute("list", list);
		
		return "infra/user/modules/member/memberPostComment";
	}	
		
	//?????????_??????????????????
	@RequestMapping(value="memberWithdraw")
	public String memberWithdraw( Model model ,SgwDto sgwDto)throws Exception {
		getSss(model,sgwDto);
		return "infra/user/modules/member/memberWithdraw";
	}
	
	// user,admin ???????????? ?????? ?????? ?????? ???????????????????????????
	@RequestMapping(value = "ueleteMm")
	public String ueleteMm(MemberGroup dto , RedirectAttributes redirectAttributes)throws Exception {
		service.ueleteMm(dto);
		session.invalidate();
		return "redirect:/";
	}
	
	//?????????/?????? ??????
	@RequestMapping(value="findMyLogin")
	public String findUser() {
		return "infra/user/modules/home/findMyLogin";
	}
	


}
