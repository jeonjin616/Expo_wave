package com.multi.wave.md;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



//해당 패키지 controller로 바꾸면 에러가 나타납니다.. 일단 wave로 진행중

@Controller

public class MDController {

	@Autowired
	MDPostDAO MDpostDAO;

	@Autowired
	MDImgDAO MDimgDAO;

	@Autowired
	MDCommentDAO MDcommentDAO;

	// 전체 게시글 보기(posts+img)
	@RequestMapping(value = "md/MDAll", method = RequestMethod.GET)
	public void MDAll(Model model1, Model model2) {
		List<MDPostDTO> mdpostall = MDpostDAO.MDAll();
		model1.addAttribute("mdpostall", mdpostall);
	}

	
	// 게시글 상세보기 -> 이미지,댓글,게시글 전부 가져옴 (content+img+posts)
	@RequestMapping(value = "md/MDDetail", method = RequestMethod.GET)
	public void MDDetail(@RequestParam("id") int id, Model model1, Model model2, Model model3) {
		MDPostDTO postdto = MDpostDAO.getMDPostById(id);
		List<MDCommentDTO> commentdto = MDcommentDAO.getMDCommentById(id);
		
		model1.addAttribute("postdto", postdto);
		model3.addAttribute("commentdto", commentdto);
//		return "md/MDDetail"; // 상세페이지 뷰 이름
	}

	// 게시글 검색하기(img+posts)
	@RequestMapping("MDPostsearch")
	public String MDPostSearch() {
		return "redirect:/md/MDAll";
	}

	// 게시글 만들기 (img+posts)
	@RequestMapping("md/MDPostMake")
	public String MDPostMake(MDPostDTO mdPostDTO, HttpServletRequest request, MultipartFile file, Model model)
			throws Exception {
		//이클립스는 폴더 하단에 동기화해서 만들어놓고 이를 절대경로에서 확인이 가능하다(82q
		//동일한 파일명으로 올리는경우 파일이 중복됮 ㅣ않도록 처리해얗나다 -> UUID활용방식
		String test = UUID.randomUUID().toString();
		System.out.println(mdPostDTO);
		String savedName =  test+"_"+file.getOriginalFilename();
		//원본 파일명 보여주기위한 목적용 코드 OR split활용
		String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");
		File target = new File(uploadPath + "/" + savedName);
		System.out.println(target.getAbsolutePath());
		file.transferTo(target);
		model.addAttribute("savedName", savedName);
		mdPostDTO.setMD_post_Thumbnail(savedName);
		MDpostDAO.MDPostinsert(mdPostDTO);
		return "redirect:/md/MDAll";
	}
	
	//C:\eclipse-workspace\wave\src\main\webapp\resources\img\noimg.png
	//C:\eclipse-workspace\5final_main\src\main\webapp\resources\img\logo.png

	// 업데이트 페이지이동
	@RequestMapping(value = "md/MDPostUpdatePage", method = RequestMethod.GET)
	public String mdPostUpdatePage(@RequestParam("id") int id, Model model) {
		MDPostDTO mdPostDTO = MDpostDAO.getMDPostById(id);
		model.addAttribute("mdPostDTO", mdPostDTO);
		return "MDPostUpdate";
	}

	// 게시글 업데이트
	@RequestMapping(value = "md/MDPostUpdate", method = RequestMethod.POST)
	public String mdPostUpdate(MDPostDTO mdPostDTO) {
		MDpostDAO.MDPostUpdate(mdPostDTO);
		return "redirect:/md/MDDetail?id=" + mdPostDTO.getMD_id();
	}

	// 게시글 삭제하기
	@RequestMapping("md/MDPostDelete")
	public String MDPostDelete(MDPostDTO mdPostDTO, RedirectAttributes redirectAttributes) {
		System.out.println(mdPostDTO);
		redirectAttributes.addFlashAttribute("message", "게시글이 삭제되었습니다.");
		System.out.println("message실행?");
		MDpostDAO.MDPostDelete(mdPostDTO);
		return "redirect:/md/MDAll";
	}
	//////////// 댓글 /////////////

	// 댓글 달기
	@RequestMapping("md/MDCommentMake")
	public String MDCommentMake(MDCommentDTO mdcommentDTO) {
		MDcommentDAO.MDCommentinsert(mdcommentDTO);
		return "redirect:/md/MDDetail?id=" + mdcommentDTO.getMD_id();
	}

	// 댓글 삭제하기
	@RequestMapping("md/MDCommentDelete")
	public String MDCommentDelete(MDCommentDTO MDcommentdto, RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("message", "댓글이 삭제되었습니다.");
		int number = MDcommentdto.getMD_id();
		MDcommentDAO.MDCommentdelete(MDcommentdto);
		System.out.println(MDcommentdto.getMD_comment_id());
		return "redirect:/md/MDDetail?id=" + number;
	}

	// 댓글 수정하기
	//
	@RequestMapping("md/MDCommentUpdate")
	public String MDCommentUpdate(MDCommentDTO MDcommentdto, RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("message", "댓글이 수정되었습니다.");
		MDcommentDAO.MDCommentupdate(MDcommentdto);
		System.out.println(MDcommentdto.getMD_id());
		return "redirect:/md/MDDetail?id=" + MDcommentdto.getMD_id();
	}
}
