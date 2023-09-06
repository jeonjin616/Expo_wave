package com.multi.wave.notice;

import java.awt.PageAttributes.MediaType;
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
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String insert2(@RequestParam("file") MultipartFile file,
	                      @RequestParam("faq_title") String title,
	                      @RequestParam("faq_content") String content,
	                      RedirectAttributes redirectAttributes,
	                      HttpServletRequest request) throws Exception {

	    FaqVO dto = new FaqVO();
	    dto.setFaq_title(title);
	    dto.setFaq_content(content);

	    String test = UUID.randomUUID().toString();
	    String savedName = (!file.isEmpty()) ? test + "_" + file.getOriginalFilename() : null;

	    if (savedName != null) {
	        String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload");
	        File target = new File(uploadPath + "/" + savedName);
	        file.transferTo(target);
	        dto.setImg(savedName);
	    }

	    dao.insert(dto);
	    redirectAttributes.addFlashAttribute("message", "추가가 완료되었습니다.");
	    return "redirect:faq";
	}



	@GetMapping("notice/faq_edit")
	public String edit(@RequestParam("faq_id") int faq_id, Model model) {
		FaqVO dto = dao.oneById(faq_id); // 새로운 메서드 호출
		model.addAttribute("dto", dto);
		return "notice/faq_update"; // 수정 페이지로 이동
	}

	// 수정 작업을 처리하는 메서드
	@PostMapping("notice/faq_update_action")
	public String update(@RequestParam("file") MultipartFile file, @RequestParam("faq_id") int faqId,
	                     @RequestParam("faq_title") String title, @RequestParam("faq_content") String content,
	                     RedirectAttributes redirectAttributes,
	                     HttpServletRequest request) throws Exception {

	    FaqVO dto = new FaqVO();
	    dto.setFaq_id(faqId); // faq_id를 설정
	    dto.setFaq_title(title); // title 설정
	    dto.setFaq_content(content); // question 설정

	    FaqVO existingFaq = dao.oneById(faqId); // 파라미터로 받은 faq_id를 사용

	    if (existingFaq != null) {
	        String test = UUID.randomUUID().toString();
	        String savedName = (file != null && !file.isEmpty()) ? test + "_" + file.getOriginalFilename() : "";
	        if (!savedName.isEmpty()) {
	        	String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload");
	            File target = new File(uploadPath + "/" + savedName);
	            file.transferTo(target);
	            dto.setImg(savedName);
	        } else {
	            dto.setImg(existingFaq.getImg());
	        }

	        if (dto.getFaq_title().isEmpty()) {
	            dto.setFaq_title(existingFaq.getFaq_title());
	        }
	        if (dto.getFaq_content().isEmpty()) {
	            dto.setFaq_content(existingFaq.getFaq_content());
	        }
	    }

	    dao.update(dto);
	    redirectAttributes.addFlashAttribute("message", "수정이 완료되었습니다.");

	    return "redirect:faq";
	}


	@RequestMapping("notice/faq_delete")
	public String delete(@RequestParam("faq_id") int faq_id) {
		FaqVO faqVO = new FaqVO();
		faqVO.setFaq_id(faq_id); // faq_id를 설정하는 메서드명은 실제 VO 클래스에 맞게 변경해야 함

		int result = dao.delete(faqVO);

		return "redirect:faq"; // 리다이렉트 경로를 프로젝트에 맞게 수정
	}

	@RequestMapping("notice/faq_one")
	public String one(int id, String title, Model model) {
		FaqVO dto = dao.one(id, title);
		model.addAttribute("dto", dto);
		return "notice/faq_one"; // 조회 결과를 보여줄 뷰 이름
	}

	@RequestMapping("notice/faq_one2")
	public String one2(@RequestParam("id") int id, Model model) {
		FaqVO dto = dao.oneById(id); // ID만 사용하여 데이터 조회
		model.addAttribute("dto", dto);
		return "notice/faq_one"; // 조회 결과를 보여줄 뷰 이름
	}

	@RequestMapping("notice/faq")
	public String list(Model model, @RequestParam(name = "page", defaultValue = "1") int currentPage, PagingVO2 vo) {
	    vo.setStartEnd(currentPage);
	    List<FaqVO> page = dao.getPagedFaq(vo);

	    int count = dao.pageCount();
	    int pages = (count + vo.getPerPageNum() - 1) / vo.getPerPageNum();

	    int startPage = ((currentPage - 1) / 5) * 5 + 1;
	    int endPage = startPage + 4;
	    if (endPage > pages) {
	        endPage = pages;
	    }

	    model.addAttribute("list", page);
	    model.addAttribute("pages", pages);
	    model.addAttribute("startPage", startPage);
	    model.addAttribute("endPage", endPage);
	    model.addAttribute("count", count);

	    return "notice/faq";
	}
	
	
	@GetMapping(value = "notice/faq_ajaxSearch")
    @ResponseBody
    public List<FaqVO> ajaxSearch(@RequestParam("query") String query) {
        return dao.searchFaq(query);
    }

}
