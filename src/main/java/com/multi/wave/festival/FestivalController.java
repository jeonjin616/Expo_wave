package com.multi.wave.festival;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FestivalController {

	   @Autowired
	    FestivalService festivalService;
	    
		@Autowired
	    FestivalDAO festivalDAO;

		@RequestMapping("list/festival")
		public void insert(FestivalParser parser) throws Exception {

			festivalDAO.deleteAll();
			
			for (int i = 1; i < 2; i++) {

				ArrayList<FestivalVO> list = parser.parse(i);
				for (FestivalVO festivalVO : list) {
					festivalService.insert(festivalVO);
				}
			}

		}
	   
		  @RequestMapping("list/festivallist")
		    public String list(Model model) {
		        List<FestivalVO> list = festivalService.list();
		        model.addAttribute("festival", list);
		        return "list/festivallist";
	    }
}
