package com.multi.wave.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {

	@Autowired
	MemberDAO dao;
	
	@Autowired
	MemberService service;
	
	// 회원가입 페이지로 이동
	@RequestMapping("/join")
	public String join() {
		return "join";
	}
	
	// id 중복 체크
	@RequestMapping("member/idChk")
	@ResponseBody
	public String idCheck(String mem_id) {
		System.out.println(mem_id);	// 사용자가 입력한 id 콘솔에 출력	
		return service.memidCheck(mem_id);
	}
	
	// 회원 가입 
	@RequestMapping("member/insert")
	public String insert(MemberVO vo){
		vo.setMem_email(vo.getMemEmail()+vo.getDomainList());
		System.out.println(vo); 	// 암호화 전 vo 출력
		service.join(vo);
		System.out.println(vo);		// 암호화 후 vo 출력
		return "redirect:../index.jsp";
	}
	
	// 로그인
	@RequestMapping("member/login")
	@ResponseBody
	public boolean login(MemberVO vo, HttpSession session) {
		boolean result = service.login(vo);
		if(result) {	
			// 로그인 성공 시 세션 변수 지정
			session.setAttribute("loginMember", vo.getMem_id());
		} 
		return result;
	}
	
	// 로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index.jsp";
	}
	
}
