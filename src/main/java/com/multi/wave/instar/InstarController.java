package com.multi.wave.instar;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class InstarController {

	@Autowired
	InstarDAO instardao;
	
	@Autowired
	InstarService instarservice;
	
	@RequestMapping("instar/instarpage")
	public void test1(InstarVO vo, Model model,Model model2, PagingVO page) {
		//삭제하기
		instardao.instarDelete();
		//값 넣기
		instarservice.instarUpate();
		System.out.println(page);
		page.setStartEnd(page.getPage());
		
		System.out.println();
		System.out.println();
		List<InstarVO> card = instardao.instarUpdate2(page);
		int count = instardao.count();
		int pages = count / 10+1;
		System.out.println(card);
		model2.addAttribute("pages", pages);
		model.addAttribute("card",card);
	}
	
	
	
}
