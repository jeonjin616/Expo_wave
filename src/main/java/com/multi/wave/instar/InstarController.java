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
	public void test1(InstarVO vo, Model model) {
		//삭제하기
		instardao.instarDelete();
		//값 넣기
		instarservice.instarUpate();
		
		List<InstarVO> card = instardao.instarUpdate(vo);
		System.out.println(card);
		model.addAttribute("card",card);
	}
	
	
	
}
