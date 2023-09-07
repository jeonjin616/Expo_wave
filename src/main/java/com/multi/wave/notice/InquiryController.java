package com.multi.wave.notice;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
public class InquiryController {

	@Autowired
	InquiryDAO dao;
	
	@Autowired
	ReplyDAO reply;

	@RequestMapping("notice/inqu_insert")
	public void insert(InquiryVO dto) {
		int result = dao.insert(dto);
	}

	@RequestMapping("notice/inqu_insert2")
	public String insert2(@RequestParam("file") MultipartFile file,
	                      @RequestParam("inqu_title") String title,
	                      @RequestParam("inqu_question") String question,
	                      RedirectAttributes redirectAttributes,
	                      HttpServletRequest request) throws Exception {

	    HttpSession session = request.getSession();
	    String loginMember = (String) session.getAttribute("loginMember");

	    InquiryVO dto = new InquiryVO();
	    dto.setInqu_title(title);
	    dto.setInqu_question(question);
	    dto.setWriter(loginMember);

	    String test = UUID.randomUUID().toString();
	    String savedName = (!file.isEmpty()) ? test + "_" + file.getOriginalFilename() : null;

	    if (savedName != null) {
	        String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload");
	        File target = new File(uploadPath + "/" + savedName);
	        file.transferTo(target);
	        dto.setImg(savedName);
	    }

	    dao.insert(dto);
	    redirectAttributes.addFlashAttribute("message", "게시글 추가가 완료되었습니다.");
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
		redirectAttributes.addFlashAttribute("message", "게시글 수정이 완료되었습니다");

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
		List<ReplyVO> replies = reply.getRepliesByPostId(id);
		model.addAttribute("dto", dto);
		model.addAttribute("replies", replies);
		return "notice/inqu_one"; 
	}

	@RequestMapping("notice/inqu_one2")
	public String one2(@RequestParam("id") int id, Model model) {
		InquiryVO dto = dao.oneById(id); 
		model.addAttribute("dto", dto);
		return "notice/faq_one"; 
	}

	@RequestMapping("notice/inqu")
	public String list(Model model, HttpSession session, HttpServletResponse response,@RequestParam(name = "page", defaultValue = "1") int currentPage, PagingVO2 vo) throws IOException {
	    String loginMember = (String) session.getAttribute("loginMember");

	    if (loginMember == null || loginMember.isEmpty()) {
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('로그인을 해주세요.'); location.href='../member/login.jsp';</script>");
	        out.flush();
	        return null;
	    }

	    List<InquiryVO> list;
	    if("admin".equals(loginMember)) {
	        list = dao.listAll();  // admin�씪 寃쎌슦 紐⑤뱺 寃뚯떆臾쇱쓣 媛��졇�삤�뒗 硫붿꽌�뱶
	    } else {
	        list = dao.listByWriter(loginMember);  // 洹� �쇅�쓽 寃쎌슦�뒗 writer 湲곗�
	    }
	    model.addAttribute("list", list);
	    
	    vo.setStartEnd(currentPage);
	    List<InquiryVO> page = dao.getPagedInqu(vo);

	    int count = dao.pageCount();
	    int pages = (count + vo.getPerPageNum() - 1) / vo.getPerPageNum();

	    int startPage = ((currentPage - 1) / 5) * 5 + 1;
	    int endPage = startPage + 4;
	    if (endPage > pages) {
	        endPage = pages;
	    }

	    model.addAttribute("list2", page);
	    model.addAttribute("pages", pages);
	    model.addAttribute("startPage", startPage);
	    model.addAttribute("endPage", endPage);
	    model.addAttribute("count", count);


	    return "notice/inqu";
	}
	
	
	@GetMapping(value = "notice/inqu_ajaxSearch")
    @ResponseBody
    public List<InquiryVO> ajaxSearch(@RequestParam("query") String query) {
        return dao.searchInqu(query);
    }

}