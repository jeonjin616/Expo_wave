package com.multi.wave.notice;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class InquiryController {

	@Autowired
	InquiryDAO dao;

	@RequestMapping("notice/inqu_insert")
	public void insert(InquiryVO dto) {
		int result = dao.insert(dto);
	}

	@RequestMapping("notice/inqu_insert2")
	public String insert2(@RequestParam("file") MultipartFile file, @RequestParam("inqu_title") String title,
			@RequestParam("inqu_question") String question, RedirectAttributes redirectAttributes,
			HttpServletRequest request) throws Exception {

		String test = UUID.randomUUID().toString();
		String savedName = test + "_" + file.getOriginalFilename();

		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload");
		File target = new File(uploadPath + "/" + savedName);

		file.transferTo(target);


		InquiryVO dto = new InquiryVO();
		dto.setInqu_title(title);
		dto.setInqu_question(question);
		dto.setImg(savedName);

		dao.insert(dto);
		redirectAttributes.addFlashAttribute("message", "추가가 완료되었습니다.");
		return "redirect:inqu";
	}

	@GetMapping("notice/inqu_edit")
	public String edit(@RequestParam("inqu_id") int inqu_id, Model model) {
		InquiryVO dto = dao.oneById(inqu_id); 
		model.addAttribute("dto", dto);
		return "notice/inqu_update"; 
	}

	
	@PostMapping("notice/inqu_update_action")
	public String update(@RequestParam("file") MultipartFile file, @RequestParam("inqu_id") int inquId,
			@RequestParam("inqu_title") String title, @RequestParam("inqu_question") String question,
			RedirectAttributes redirectAttributes, HttpServletRequest request) throws Exception {

		InquiryVO dto = new InquiryVO();
		dto.setInqu_id(inquId); 
		dto.setInqu_title(title); 
		dto.setInqu_question(question); 

		InquiryVO existingInquiry = dao.oneById(inquId); 

		if (existingInquiry != null) {
			String test = UUID.randomUUID().toString();
			String savedName = (file != null && !file.isEmpty()) ? test + "_" + file.getOriginalFilename() : "";
			if (!savedName.isEmpty()) {
				String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload");
				File target = new File(uploadPath + "/" + savedName);
				file.transferTo(target);
				dto.setImg(savedName);
			} else {
				dto.setImg(existingInquiry.getImg());
			}

			if (dto.getInqu_title().isEmpty()) {
				dto.setInqu_title(existingInquiry.getInqu_title());
			}
			if (dto.getInqu_question().isEmpty()) {
				dto.setInqu_question(existingInquiry.getInqu_question());
			}
		}

		dao.update(dto);
		redirectAttributes.addFlashAttribute("message", "수정이 완료되었습니다.");

		return "redirect:inqu";
	}

	@RequestMapping("notice/inqu_delete")
	public String delete(@RequestParam("inqu_id") int inqu_id) {
		InquiryVO inquVO = new InquiryVO();
		inquVO.setInqu_id(inqu_id); //

		int result = dao.delete(inquVO);

		return "redirect:inqu";
	}

	@RequestMapping("notice/inqu_one")
	public String one(int id, String title, Model model) {
		InquiryVO dto = dao.one(id, title);
		model.addAttribute("dto", dto);
		return "notice/inqu_one"; // �뜝�룞�삕�쉶 �뜝�룞�삕�뜝�룞�삕�뜝占� �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕 �뜝�떛紐뚯삕
	}

	@RequestMapping("notice/inqu_one2")
	public String one2(@RequestParam("id") int id, Model model) {
		InquiryVO dto = dao.oneById(id); // ID�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�눥�뜝占� �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�쉶
		model.addAttribute("dto", dto);
		return "notice/faq_one"; // �뜝�룞�삕�쉶 �뜝�룞�삕�뜝�룞�삕�뜝占� �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕 �뜝�떛紐뚯삕
	}

	@RequestMapping("notice/inqu")
	public String list(Model model) {
		List<InquiryVO> list = dao.list();
		model.addAttribute("list", list);
		return "notice/inqu";
	}

}