package com.sgworld.infra.modules.user.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sgworld.infra.modules.admin.board.AdminBoardDto;
import com.sgworld.infra.modules.admin.board.AdminBoardServiceImpl;
import com.sgworld.infra.modules.admin.board.AdminBoardVo;

@Controller
@RequestMapping(value = "/board/")
public class BoardController {
	
	@Autowired
	AdminBoardServiceImpl service;
	
	//계시판 리스트
	@RequestMapping(value = "boardList")
	public String boardList(@ModelAttribute("vo") AdminBoardVo vo, Model model) throws Exception {
		
		vo.setParamsPaging(service.selectOneCount(vo));
		
		List<AdminBoardDto> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "infra/user/modules/board/boardHome";
	}
	
	//게시글 보기
	@RequestMapping(value = "boardView")
	public String boardView(@ModelAttribute("vo") AdminBoardVo vo, Model model) throws Exception {
		
		AdminBoardDto item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		return "infra/user/modules/board/boardView";
	}
	
	//계시판 글쓰기
	@RequestMapping(value = "boardWrite")
	public String boardWrite() {
		
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
}
