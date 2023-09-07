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

	@RequestMapping("my2")
	@ResponseBody
	public List<MyVO> my2(String find) {
		System.out.println(find);
		List<MyVO> list = myService.list(find);
		System.out.println(list.size());
		return list;
	}

	/*
	 * @RequestMapping("my3")
	 *
	 * @ResponseBody public List<MyVO2> my3() { return myService.list2(); }
	 *
	 * @RequestMapping("my4")
	 *
	 * @ResponseBody public List<MyVO2> my4(String find2) {
	 * System.out.println(find2); List<MyVO2> list2 = myService.list2(find2);
	 * System.out.println(list2.size()); return list2; }
	 */
}