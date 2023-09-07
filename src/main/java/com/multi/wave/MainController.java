package com.multi.wave;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.wave.review.ReviewService;
import com.multi.wave.review.ReviewVO;

@Controller
public class MainController {
	
	@Autowired
	MainService MainService;
	
	@RequestMapping("list_festival")
	@ResponseBody
	public List<MainFestivalVO> list() {
		List<MainFestivalVO> list = MainService.list();
		//model.addAttribute("festival", list);
		return list;
	}
	
	@RequestMapping("list_show")
	@ResponseBody
	public List<MainShowVO> list2() {
		List<MainShowVO> list2 = MainService.list2();
		//model.addAttribute("festival", list);
		return list2;
	}
	
}
