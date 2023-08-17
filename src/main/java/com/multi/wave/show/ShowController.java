package com.multi.wave.show;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShowController {

	
	    @Autowired
	    ShowService showService;
	    
	    @Autowired
	    ShowDAO showDAO;
	    
	    @RequestMapping("list/show")
	    public void insert(ShowParser parser) throws Exception {
	    	
	    	showDAO.deleteAll();
	    	
	        for (int i = 1; i < 2; i++) {
	            ArrayList<ShowVO> list = parser.parse(i);
	            for (ShowVO showVO : list) {
	                showService.insert(showVO);
	            }
	        }
	    }
	    
	
	    
	    @RequestMapping("list/showlist")
	    public String list(Model model) {
	        List<ShowVO> list = showService.list();
	        model.addAttribute("show", list);
	        return "list/showlist";
	    }
	}

