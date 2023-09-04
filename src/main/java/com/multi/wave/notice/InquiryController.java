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

	    String test = UUID.randomUUID().toString();
	    String savedName = test + "_" + file.getOriginalFilename();

	    String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload");
	    File target = new File(uploadPath + "/" + savedName);
	    file.transferTo(target);

	    HttpSession session = request.getSession();
	    String loginMember = (String) session.getAttribute("loginMember");

	    InquiryVO dto = new InquiryVO();
	    dto.setInqu_title(title);
	    dto.setInqu_question(question);
	    dto.setImg(savedName);
	    dto.setWriter(loginMember); // 세션에서 가져온 값으로 작성자 설정

	    dao.insert(dto);

	    redirectAttributes.addFlashAttribute("message", "문의가 등록되었습니다.");
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
		redirectAttributes.addFlashAttribute("message", "占쎈땾占쎌젟占쎌뵠 占쎌끏�뙴�슢由븝옙肉�占쎈뮸占쎈빍占쎈뼄.");

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
		return "notice/inqu_one"; // �뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럩�뤂 �뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶占쎈쐻�뜝占� �뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥吏쀥뜝�럩援� �뜝�럥�맶�뜝�럥吏쀥뜝�럩援� �뜝�럥�맶�뜝�럥堉볡춯琉우뒩占쎄뎡
	}

	@RequestMapping("notice/inqu_one2")
	public String one2(@RequestParam("id") int id, Model model) {
		InquiryVO dto = dao.oneById(id); // ID�뜝�럥�맶�뜝�럥吏쀥뜝�럩援� �뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�떔�뜝�럥�맶占쎈쐻�뜝占� �뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥吏쀥뜝�럩援� �뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럩�뤂
		model.addAttribute("dto", dto);
		return "notice/faq_one"; // �뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럩�뤂 �뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶占쎈쐻�뜝占� �뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥吏쀥뜝�럩援� �뜝�럥�맶�뜝�럥吏쀥뜝�럩援� �뜝�럥�맶�뜝�럥堉볡춯琉우뒩占쎄뎡
	}

	@RequestMapping("notice/inqu")
	public String list(Model model, HttpSession session, HttpServletResponse response) throws IOException {
	    String loginMember = (String) session.getAttribute("loginMember");

	    if (loginMember == null || loginMember.isEmpty()) {
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('로그인을 해주세요.'); location.href='../member/login.jsp';</script>");
	        out.flush();
	        return null;
	    }

	    List<InquiryVO> list = dao.listByWriter(loginMember);
	    model.addAttribute("list", list);

	    return "notice/inqu";
	}
	
	
	@GetMapping(value = "notice/inqu_ajaxSearch")
    @ResponseBody
    public List<InquiryVO> ajaxSearch(@RequestParam("query") String query) {
        return dao.searchInqu(query);
    }

}