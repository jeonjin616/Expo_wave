package com.multi.wave.review;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.multi.wave.festival.FestivalVO;
import com.multi.wave.show.ShowVO;

@Controller
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	
	@RequestMapping("review/insert")
	public String insert(ReviewVO reviewVO, HttpServletRequest request,@RequestParam("file") MultipartFile file) throws Exception {
		
		
		String test = UUID.randomUUID().toString();
	    String savedName = test + "_" + file.getOriginalFilename();
	    System.out.println("file test " + savedName);
	    // uploadPath ����: ���ؽ�Ʈ ��� + /resources/upload
	    String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload");
	    File target = new File(uploadPath + "/" + savedName);
	    System.out.println("uploadPath === " + uploadPath);
	    file.transferTo(target);
	    reviewVO.setReview_image(savedName);
	    System.out.println("insert test" + reviewVO);
		reviewService.insert(reviewVO);
		return "redirect:/review/list";
	}
	
	
	@RequestMapping("review/list")
	public void list(Model model) {
		List<ReviewVO> list = reviewService.list();
		model.addAttribute("list", list);
		
	}
	
	@RequestMapping("review/list_fsv")
	public void list_fsv(Model model) {
		List<ReviewVO> list = reviewService.list_fsv();
		model.addAttribute("list", list);
		
	}
	
	@RequestMapping("review/list_show")
	public void list_show(Model model) {
		List<ReviewVO> list = reviewService.list_show();
		model.addAttribute("list", list);
		
	}
	
	@RequestMapping("review/one")
	public void one(int review_id, Model model) {
		System.out.println(review_id);
		ReviewVO one = reviewService.one(review_id);
		System.out.println(one);
		model.addAttribute("one", one);
		
	}
	
	@RequestMapping("review/search_fsv")
	@ResponseBody
	public List<FestivalVO> search_fsv(String q) {
		System.out.println("fsv" + q);
		System.out.println("fsv222" + reviewService.search_fsv(q));
			return reviewService.search_fsv(q);
		
	}
	
	@RequestMapping("review/search_show")
	@ResponseBody
	public List<ShowVO> search_show(String q) {
		System.out.println("show" + q);
		return reviewService.search_show(q);
		
	}
	
	@RequestMapping("review/updateReview")
	public String update(ReviewVO reviewVO, HttpServletRequest request,@RequestParam("file") MultipartFile file) throws Exception {
		
		String test = UUID.randomUUID().toString();
	    String savedName = test + "_" + file.getOriginalFilename();
	    System.out.println("file test " + savedName);
	    // uploadPath ����: ���ؽ�Ʈ ��� + /resources/upload
	    String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload");
	    File target = new File(uploadPath + "/" + savedName);
	    System.out.println("uploadPath === " + uploadPath);
	    file.transferTo(target);
	    reviewVO.setReview_image(savedName);
		reviewService.update(reviewVO);
		System.out.println("update test >>> " + reviewVO);
		 
		return "redirect:/review/one?review_id=" + reviewVO.getReview_id();
	}
	
	@RequestMapping("review/delete")
	@ResponseBody
	public String delete(int review_id) {
		reviewService.delete(review_id);
		return "delete okay";
		//return "redirect:/review/list";
	}
}

