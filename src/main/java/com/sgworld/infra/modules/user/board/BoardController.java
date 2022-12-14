package com.sgworld.infra.modules.user.board;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sgworld.infra.modules.admin.board.AdminBoardDto;
import com.sgworld.infra.modules.admin.board.AdminBoardServiceImpl;
import com.sgworld.infra.modules.admin.board.AdminBoardVo;
import com.sgworld.infra.modules.user.sgWorld.SgwSerivceImpl;
import com.sgworld.infra.modules.user.sgWorld.sgwdto.SgwDto;

@Controller
@RequestMapping(value = "/board/")
public class BoardController {
	
	@Autowired
	AdminBoardServiceImpl service;
	@Autowired
	SgwSerivceImpl sgwService;
	@Autowired
	HttpSession session;
	
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
	
	//????????? ?????????
	@RequestMapping(value = "boardList")
	public String boardList(@ModelAttribute("vo") AdminBoardVo vo, Model model ,SgwDto sgwDto) throws Exception {
		
		getSss(model,sgwDto);
		
		vo.setParamsPaging(service.selectOneCount(vo));
		List<AdminBoardDto> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_MONTH, -1); //7?????? ???????????? ???????????????.
        String nowday = format.format(cal.getTime());
        model.addAttribute("nowday",nowday);
		
		return "infra/user/modules/board/boardHome";
	}
	
	//????????? ??????
	@RequestMapping(value = "boardView/{bdSeq}")
	public String boardView(@ModelAttribute("vo") AdminBoardVo vo, AdminBoardDto dto, Model model,
				@PathVariable String bdSeq ,SgwDto sgwDto) throws Exception {
		
		getSss(model,sgwDto);
		
		service.boardViewCount(dto); //?????????
		
		AdminBoardDto like = service.boardLiked(vo); //????????? ??????
		model.addAttribute("like", like);
		
		int likeCount = service.boardLikeCount(vo); //????????? count
		model.addAttribute("likeCount", likeCount);
		
		AdminBoardDto item = service.selectOne(vo); //????????? ????????? ?????? ??????
		model.addAttribute("item", item);
		System.out.println("boardCount:" + item.getCommentCount());
		
		return "infra/user/modules/board/boardView";
	}
	
	//????????? ????????? ????????? ???????????????? ???????
	@RequestMapping(value = "boardCommentLita")
	public String boardCommentLita(@ModelAttribute("vo") AdminBoardVo vo, Model model) throws Exception {
		vo.setParamsPaging(service.selectCommentCount(vo));
		
		List<AdminBoardDto> list = service.selectCommentList(vo);//???????????? ?????????
		model.addAttribute("list", list);
		
		return "infra/user/modules/board/boardCommentLita";
	}
	
	//?????? ????????? ??????
	@RequestMapping(value = "boardReCommentLita")
	public String boardReCommentLita(@ModelAttribute ("vo") AdminBoardVo vo , Model model)throws Exception{
		
		vo.setSelectReCommentCount(service.selectReCommentCount(vo));
		/* System.out.println("selectReCommentCount: "+); */
		
		List<AdminBoardDto> listt = service.recommentList(vo);//???????????? ????????? 
		model.addAttribute("listt", listt);
		return "infra/user/modules/board/boardCommentLita";
	}
	
	//????????? ?????????
	@RequestMapping(value = "boardWrite")
	public String boardWrite(SgwDto sgwDto,Model model) {
		getSss(model,sgwDto);
		return "infra/user/modules/board/boardRegForm"; 
	}

	@SuppressWarnings(value = {"all"})
	@RequestMapping(value = "boardInst")
	public String boardInst(AdminBoardVo vo, AdminBoardDto dto, RedirectAttributes redirectAttributes) throws Exception {
		
		service.insert(dto);
		vo.setBdSeq(dto.getBdSeq());
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/board/boardList";
	}
	
	@SuppressWarnings(value = {"all"})
	@RequestMapping(value = "commentInst")
	public String commentInst(AdminBoardVo vo, AdminBoardDto dto, RedirectAttributes redirectAttributes) throws Exception {
		service.commentInst(dto);
		vo.setCmSeq(dto.getCmSeq());
		vo.setBdSeq(dto.getBdSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/board/boardView";
	}
	
	@RequestMapping(value = "commentDele")
	public String commentDele(AdminBoardVo vo, RedirectAttributes redirectAttributes) throws Exception {
		service.commentDele(vo);
		return "redirect:/board/boardView";
	}
	
	@RequestMapping(value = "boardUpdt")
	public String boardUpdt(AdminBoardVo vo, AdminBoardDto dto, RedirectAttributes redirectAttributes) throws Exception {
		service.update(dto);
		return "redirect:/board/boardList";
	}
	
	@RequestMapping(value = "boardUele")
	public String boardUele(AdminBoardVo vo, AdminBoardDto dto, RedirectAttributes redirectAttributes) throws Exception {
		service.uelete(dto);
		return "redirect:/board/boardList";
	}
	
	@RequestMapping(value = "boardDele")
	public String boardDele(AdminBoardVo vo, RedirectAttributes redirectAttributes) throws Exception {
		service.delete(vo);
		return "redirect:/board/boardList";
	}
	
	//?????????
	@ResponseBody
	@RequestMapping(value = "boardLike")
	public Map<String, Object> boardLike(AdminBoardDto dto, AdminBoardVo vo) throws Exception {

		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		int result = service.insertLike(dto);
		int likedCount = service.boardLikeCount(vo);

		if (result == 0) {
			returnMap.put("rt", "fail");
		} else {
			returnMap.put("rt", "success");	
			returnMap.put("likedCount", likedCount);
		}
		return returnMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "boardUnLike")
	public Map<String, Object> boardUnLike(AdminBoardDto dto, AdminBoardVo vo) throws Exception {

		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		int result = service.deleteLike(vo);
		int likedCount = service.boardLikeCount(vo);

		if (result == 0) {
			returnMap.put("rt", "fail");
		} else {
			returnMap.put("rt", "success");	
			returnMap.put("likedCount", likedCount);
		}
		return returnMap;
	}
	
	@SuppressWarnings(value = {"all"})
	@RequestMapping(value = "recommentInst")
	public String reComentInst(AdminBoardVo vo, AdminBoardDto dto) throws Exception {
		System.out.println("inst!!");
		service.reComentInst(dto);
		vo.setCmSeq(dto.getCmSeq());
		vo.setBdSeq(dto.getBdSeq());
		return "infra/user/modules/board/boardCommentLita";
	}
	
	
}
