package com.multi.wave.notice;

import java.io.File;
import java.util.Date;
import java.util.List;

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
public class FaqController {

	@Autowired
	FaqDAO dao;

	@RequestMapping("notice/faq_insert")
	public void insert(FaqVO dto, Model model) {
		int result = dao.insert(dto);
		model.addAttribute("dto", dto);
	}

	@RequestMapping("notice/faq_insert2")
	public String insert2(@RequestParam("file") MultipartFile file, @RequestParam("faq_title") String title,
			@RequestParam("faq_question") String question, Model model) throws Exception {
		String savedName = file.getOriginalFilename();

		String uploadPath = "C:\\Users\\User\\Documents\\workspace-sts-3.9.12.RELEASE\\Expo_wave333\\src\\main\\webapp\\resources\\img";
		File target = new File(uploadPath + "/" + savedName);

		file.transferTo(target);

		model.addAttribute("savedName", savedName);

		// �� �κп��� BoardVO ��ü�� �����ϰ� �ʵ带 ä���־�� �մϴ�.
		FaqVO dto = new FaqVO();
		dto.setFaq_title(title);
		dto.setFaq_question(question);
		dto.setImg(savedName);

		dao.insert(dto);

		return "redirect:faq";

	}

	@GetMapping("notice/faq_edit")
	public String edit(@RequestParam("faq_id") int faq_id, Model model) {
		FaqVO dto = dao.oneById(faq_id); // ���ο� �޼��� ȣ��
		model.addAttribute("dto", dto);
		return "notice/faq_update"; // ���� �������� �̵�
	}

	// ���� �۾��� ó���ϴ� �޼���
	@PostMapping("notice/faq_update_action")
	public String update(@RequestParam("file") MultipartFile file, @RequestParam("faq_id") int faqId, 
			@RequestParam("faq_title") String title, @RequestParam("faq_question") String question,
			RedirectAttributes redirectAttributes) throws Exception {

		FaqVO dto = new FaqVO();
		dto.setFaq_id(faqId); // faq_id�� ����
		dto.setFaq_title(title); // title ����
		dto.setFaq_question(question); // question ����

		FaqVO existingFaq = dao.oneById(faqId); // �Ķ���ͷ� ���� faq_id�� ���

		if (existingFaq != null) {
			String savedName = (file != null && !file.isEmpty()) ? file.getOriginalFilename() : "";
			if (!savedName.isEmpty()) {
				String uploadPath = "C:\\Users\\User\\Documents\\workspace-sts-3.9.12.RELEASE\\Expo_wave333\\src\\main\\webapp\\resources\\img";
				File target = new File(uploadPath + "/" + savedName);
				file.transferTo(target);
				dto.setImg(savedName);
			} else {
				dto.setImg(existingFaq.getImg());
			}

			if (dto.getFaq_title().isEmpty()) {
				dto.setFaq_title(existingFaq.getFaq_title());
			}
			if (dto.getFaq_question().isEmpty()) {
				dto.setFaq_question(existingFaq.getFaq_question());
			}
		}

		
		
		dao.update(dto);
		redirectAttributes.addFlashAttribute("message", "������ �Ϸ�Ǿ����ϴ�."); 
		
		return "redirect:faq"; 
	}

	@RequestMapping("notice/faq_delete")
	public String delete(@RequestParam("faq_id") int faq_id) {
		FaqVO faqVO = new FaqVO();
		faqVO.setFaq_id(faq_id); // faq_id�� �����ϴ� �޼������ ���� VO Ŭ������ �°� �����ؾ� ��

		int result = dao.delete(faqVO);

		return "redirect:faq"; // �����̷�Ʈ ��θ� ������Ʈ�� �°� ����
	}

	@RequestMapping("notice/faq_one")
	public String one(int id, String title, Model model) {
		FaqVO dto = dao.one(id, title);
		model.addAttribute("dto", dto);
		return "notice/faq_one"; // ��ȸ ����� ������ �� �̸�
	}

	@RequestMapping("notice/faq_one2")
	public String one2(@RequestParam("id") int id, Model model) {
		FaqVO dto = dao.oneById(id); // ID�� ����Ͽ� ������ ��ȸ
		model.addAttribute("dto", dto);
		return "notice/faq_one"; // ��ȸ ����� ������ �� �̸�
	}

	@RequestMapping("notice/faq")
	public String list(Model model) {
		List<FaqVO> list = dao.list();
		model.addAttribute("list", list);
		return "notice/faq";
	}

}
