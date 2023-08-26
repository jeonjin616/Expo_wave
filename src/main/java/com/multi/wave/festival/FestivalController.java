package com.multi.wave.festival;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/list")
public class FestivalController {

	@Autowired
	FestivalService festivalService;

	@Autowired
	FestivalDAO festivalDAO;

	@RequestMapping("/festival")
	public void insert(FestivalParser parser) throws Exception {

		festivalDAO.deleteAll();

		for (int i = 1; i < 2; i++) {

			ArrayList<FestivalVO> list = parser.parse(i);
			for (FestivalVO festivalVO : list) {
				festivalService.insert(festivalVO);
			}
		}

	}

	@RequestMapping("/festivallist")
	public String list(Model model) {
		List<FestivalVO> list = festivalService.list();
		model.addAttribute("festival", list);
		return "list/festivallist";
	}

	@RequestMapping("festivaldetail/{{fsv_id}")
	public String festivalDetail(@PathVariable("fsv_id") int showId, Model model) {
		return "festivaldetail"; // Return the name of the JSP view
	}

	@RequestMapping("/festivallist2")
	public void list2(PageVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<FestivalVO> list2 = festivalDAO.list2(vo);
		//System.out.println(list2.size());
		model.addAttribute("list2", list2);
	}

	@RequestMapping("/festivalAll")
	public String all2(PageVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<FestivalVO> list2 = festivalDAO.all(vo);
		int count = festivalDAO.count();
		System.out.println("all count>> " + count);
		int pages = count / 16 + (count % 16 > 0 ? 1 : 0);
		model.addAttribute("list2", list2);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
		return "list/festivalAll";
	}

}
