package com.multi.wave.my;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MyController {
	@Autowired
	MyService myService;
	
	@RequestMapping("my")
	@ResponseBody
	public List<MyVO> my() {
		return myService.list();
	}
}
