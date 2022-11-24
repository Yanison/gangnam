package com.sgworld.infra.modules.admin.home;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sgworld.infra.common.constants.Constants;
import com.sgworld.infra.modules.admin.membergroup.MemberGroup;
import com.sgworld.infra.modules.admin.membergroup.MemberGroupServiceImpl;

@Controller
@RequestMapping(value="/admin/")
public class AdminHomeController {
	
	@Autowired
	MemberGroupServiceImpl service;
	
	
	@RequestMapping(value="adminHome")
	public String adminHome() throws Exception {
		return "infra/admin/adminHome/adminHome";
	}
	
	@RequestMapping(value="adminLogin")
	public String adminLogin() throws Exception {
		return "infra/admin/adminHome/adminLogin";
	}

	//관리자 로그인
	@ResponseBody
	@RequestMapping(value = "xdminLoginProc")
	public Map<String, Object> xdminLoginProc(MemberGroup dto, HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();

		MemberGroup rtMember = service.selectOneXdminId(dto);

		if (rtMember != null) {
			MemberGroup rtMember2 = service.selectOneXdminLogin(dto);

			if (rtMember2 != null) {
				httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
				httpSession.setAttribute("infrMmSeq", rtMember2.getInfrMmSeq());
				httpSession.setAttribute("infrMmId", rtMember2.getInfrMmId());
				httpSession.setAttribute("infrMmName", rtMember2.getInfrMmName());
				returnMap.put("rt", "success");
			} else {
				returnMap.put("rt", "fail");
			}
		} else {
			returnMap.put("rt", "fail");
		}
		return returnMap;
	}
	
	//로그아웃
	@ResponseBody
	@RequestMapping(value = "xdminLogoutProc")
	public Map<String, Object> logoutProc(HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		/* UtilCookie.deleteCookie(); */
		httpSession.invalidate();
		returnMap.put("rt", "success");
		return returnMap;
	}
	
}
