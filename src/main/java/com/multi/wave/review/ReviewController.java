package com.multi.wave.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.wave.festival.FestivalVO;
import com.multi.wave.show.ShowVO;

@Controller
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	
	@RequestMapping("review/insert")
	public String insert(ReviewVO reviewVO) {
		System.out.println("insert test" + reviewVO);
		reviewService.insert(reviewVO);
		return "redirect:/review/list";
	}
	
	
	@RequestMapping("review/list")
	public void list(Model model) {
		List<ReviewVO> list = reviewService.list();
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
	
	@RequestMapping("review/update")
	public String update(ReviewVO reviewVO) {
		reviewService.update(reviewVO);
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

