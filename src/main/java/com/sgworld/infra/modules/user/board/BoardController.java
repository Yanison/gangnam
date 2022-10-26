package com.sgworld.infra.modules.user.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/board/")
public class BoardController {
	
	//계시판 리스트
	@RequestMapping(value="boardList")
	public String boardList() {
		return "infra/user/modules/board/boardHome";
	}
	
	//계시판 글쓰기
	@RequestMapping(value="boardWrite")
	public String boardWrite() {
		return "infra/user/modules/board/boardRegForm";
	}

}
