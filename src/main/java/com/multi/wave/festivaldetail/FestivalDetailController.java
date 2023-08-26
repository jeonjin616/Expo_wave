package com.multi.wave.festivaldetail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/festivaldetail")
public class FestivalDetailController {

	@Autowired
	private FestivalDetailService festivalService;
	
	@RequestMapping("/{fsv_id}")
	public String viewFesival(@PathVariable("fsv_id") String fsv_id, Model model) {
		FestivalDetailVO festival = festivalService.selectFestival(fsv_id);
		List<FestivalDetailVO> recommendedFestival = festivalService.selectRecommendedFestival(festival.getFsv_start());
		model.addAttribute("festival", festival); 
		model.addAttribute("recommendedFestival", recommendedFestival);
		return "detail/festival_detail";
	}

	@RequestMapping("/caferestaurant")
	public String viewCafeRestaurant() {
		return "detail/caferestaurant";
	}
}
