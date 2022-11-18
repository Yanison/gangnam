package com.sgworld.infra.modules.admin.board;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;

@Controller
@RequestMapping(value="/admin/board/")
public class AdminBoardController {

	@Autowired
	AdminBoardServiceImpl service;
	
	@RequestMapping(value="infrBdList")
	public String infrBdList(@ModelAttribute("vo") AdminBoardVo vo, Model model) throws Exception {
		
		vo.setParamsPaging(service.selectOneCount(vo));
		
		List<AdminBoardDto> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "infra/admin/infrBd/infrBdList";
	}
	
	@RequestMapping(value="infrBdForm")
	public String infrBdForm() throws Exception {
		return "infra/admin/infrBd/infrBdForm";
	}
	
	@RequestMapping(value="infrBdView")
	public String infrBdView(@ModelAttribute("vo") AdminBoardVo vo, Model model) throws Exception {
		
		AdminBoardDto item = service.selectOne(vo);
		model.addAttribute("item", item);
		model.addAttribute("listUploaded", service.selectListUploaded(vo));
		return "infra/admin/infrBd/infrBdView";
	}
	
	@SuppressWarnings(value = {"all"})
	@RequestMapping(value = "infrBdInst")
	public String infrBdInst(AdminBoardVo vo, AdminBoardDto dto, RedirectAttributes redirectAttributes) throws Exception {
		
		System.out.println("bdDiv: " + dto.getBdDiv());
		System.out.println("bdTitle: " + dto.getBdTitle());
		System.out.println("bdContent: " + dto.getBdContent());
		
		service.insert(dto);
		vo.setBdSeq(dto.getBdSeq());
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/admin/board/infrBdList";
	}
	
	@RequestMapping(value = "infrBdUpdt")
	public String infrBdUpdt(AdminBoardVo vo, AdminBoardDto dto, RedirectAttributes redirectAttributes) throws Exception {
		service.update(dto);
		return "redirect:/admin/board/infrBdList";
	}
	
	@RequestMapping(value = "infrBdUele")
	public String infrBdUele(AdminBoardVo vo, AdminBoardDto dto, RedirectAttributes redirectAttributes) throws Exception {
		service.uelete(dto);
		return "redirect:/admin/board/infrBdList";
	}
	
	@RequestMapping(value = "infrBdDele")
	public String infrBdDele(AdminBoardVo vo, RedirectAttributes redirectAttributes) throws Exception {
		service.delete(vo);
		return "redirect:/admin/board/infrBdList";
	}
	
	@RequestMapping(value="uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/resources/summernote/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	
}
