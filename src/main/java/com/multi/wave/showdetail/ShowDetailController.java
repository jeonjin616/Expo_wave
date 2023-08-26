package com.multi.wave.showdetail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/showdetail")
public class ShowDetailController {

	@Autowired
	ShowDetailService showService;

	@RequestMapping("/{show_id}")
	public String viewShow(@PathVariable("show_id") String show_id, Model model) {
		ShowDetailVO show = showService.selectShow(show_id);
		List<ShowDetailVO> recommendedShow = showService.selectRecommendedShow(show.getShow_genre());
		model.addAttribute("show", show); 
		model.addAttribute("recommendedShow", recommendedShow);
		return "detail/show_detail";
	}

	@RequestMapping("/caferestaurant")
	public String viewCafeRestaurant() {
	    return "detail/caferestaurant";
	}

}
