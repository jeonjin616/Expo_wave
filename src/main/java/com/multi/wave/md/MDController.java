package com.multi.wave.md;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
	public void MDAll(Model model1, Model model2,Model model3, PagingVO vo) {
		vo.setStartEnd(vo.getPage());
		List<MDPostVO> mdpostall = MDpostDAO.MDAll(vo);
		System.out.println("mdpostall>" + mdpostall);
		
		int count = MDpostDAO.Count();
		
		System.out.println("all count>> " + count);
		int pages = count / 5+1;
		model1.addAttribute("mdpostall", mdpostall);
		model2.addAttribute("pages", pages);
		model3.addAttribute("count", count);
		System.out.println(pages);
	}

	//게시판 돌아가기 목적
	@RequestMapping("md/MDAll2")
	public String test() {
		return "redirect:/md/MDAll?page=1";
	    
	}
	
	// 게시글 상세보기 -> 이미지,댓글,게시글 전부 가져옴 (content+img+posts)
	@RequestMapping(value = "md/MDDetail", method = RequestMethod.GET)
	public void MDDetail(@RequestParam("id") int id, Model model1, Model model2, Model model3){
		MDPostVO postvo = MDpostDAO.getMDPostById(id);
		List<MDCommentVO> commentvo = MDcommentDAO.getMDCommentById(id);
		
		model1.addAttribute("postvo", postvo);
		
		model3.addAttribute("commentvo", commentvo);
	}

	// 게시글 검색하기(img+posts)
	@RequestMapping("md/MDsearch" )
	public String MDPostSearch(@RequestParam("MDsearch") String md_title, Model model1) {
		List<MDPostVO> postlist = MDpostDAO.getMDPostByTitle(md_title);
		model1.addAttribute("mdpostall",postlist);
		System.out.println(md_title);
		System.out.println(MDpostDAO.getMDPostByTitle(md_title));
		return "md/MDAll";

	}

	// 업데이트 페이지이동
		@RequestMapping(value = "md/MDPostUpdatePage", method = RequestMethod.GET)
		public String mdPostUpdatePage(@RequestParam("id") int id, Model model) {
			MDPostVO mdPostvo = MDpostDAO.getMDPostById(id);
			System.out.println(mdPostvo);
			model.addAttribute("mdPostvo", mdPostvo);
			return "MDPostUpdate";
		}
		
	// 게시글 만들기 (img+posts)
	@RequestMapping("md/MDPostMake")
	public String MDPostMake(MDPostVO mdPostvo, HttpServletRequest request, MultipartFile file, Model model)
			throws Exception {
		String test = UUID.randomUUID().toString();
		String savedName =  test+"_"+file.getOriginalFilename();
		String uploadPath2 = request.getSession().getServletContext().getRealPath("resources/img");
		File target = new File(uploadPath2 + "/" + savedName);
		file.transferTo(target);
		model.addAttribute("savedName", savedName);
		mdPostvo.setMD_post_Thumbnail(savedName);
		if(savedName.split("_").length==1) {
		mdPostvo.setMD_post_Thumbnail(null);
		}
		MDpostDAO.MDPostinsert(mdPostvo);
		return "redirect:/md/MDAll?page=1";
	}
	

	

	// 게시글 업데이트
	@RequestMapping(value = "md/MDPostUpdate", method = RequestMethod.POST)
	public String mdPostUpdate(MDPostVO mdPostvo,HttpServletRequest request, @RequestParam("file") MultipartFile file, Model model) throws Exception {
		String test = UUID.randomUUID().toString();
		System.out.println(test);
		System.out.println("");
		System.out.println("");
		String savedName =  test+"_"+file.getOriginalFilename();
		System.out.println(savedName);
		String uploadPath2 = request.getSession().getServletContext().getRealPath("resources/img");
		File target = new File(uploadPath2 + "/" + savedName);
		file.transferTo(target);
		model.addAttribute("savedName", savedName);
		mdPostvo.setMD_post_Thumbnail(savedName);
		if(savedName.split("_").length==1) {
		mdPostvo.setMD_post_Thumbnail(null);
		}
		MDpostDAO.MDPostUpdate(mdPostvo);
		return "redirect:/md/MDDetail?id=" + mdPostvo.getMD_id();
	}

	// 게시글 삭제하기
	@RequestMapping("md/MDPostDelete")
	public String MDPostDelete(MDPostVO mdPostvo, RedirectAttributes redirectAttributes) {
		System.out.println(mdPostvo);
		redirectAttributes.addFlashAttribute("message", "게시글이 삭제되었습니다.");
		System.out.println("message실행?");
		MDpostDAO.MDPostDelete(mdPostvo);
		return "redirect:/md/MDAll?page=1";
	}
	//////////// 댓글 /////////////

	// 댓글 달기
	@RequestMapping("md/MDCommentMake")
	public String MDCommentMake(MDCommentVO mdcommentvo) {
		MDcommentDAO.MDCommentinsert(mdcommentvo);
		System.out.println(mdcommentvo);

		return "redirect:/md/MDDetail?id=" + mdcommentvo.getMD_id();
	}

	// 댓글 삭제하기
	@RequestMapping("md/MDCommentDelete")
	public String MDCommentDelete(MDCommentVO MDcommentvo, RedirectAttributes redirectAttributes) {
		System.out.println(MDcommentvo);
		redirectAttributes.addFlashAttribute("message", "댓글이 삭제되었습니다.");
		MDcommentDAO.MDCommentdelete(MDcommentvo);
		
//		System.out.println(mdPostvo);
//		redirectAttributes.addFlashAttribute("message", "게시글이 삭제되었습니다.");
//		System.out.println("message실행?");
//		MDpostDAO.MDPostDelete(mdPostvo);
		return "redirect:/md/MDDetail?id=" + MDcommentvo.getMD_id();
	}

	// 댓글 수정하기
	//
	@RequestMapping("md/MDCommentUpdate")
	public String MDCommentUpdate(MDCommentVO MDcommentvo, RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("message", "댓글이 수정되었습니다.");
		int number = MDcommentvo.getMD_id();
		System.out.println(MDcommentvo);
		MDcommentDAO.MDCommentupdate(MDcommentvo);
		System.out.println(MDcommentvo.getMD_id());
		return "redirect:/md/MDDetail?id=" + MDcommentvo.getMD_id();
	}
}

