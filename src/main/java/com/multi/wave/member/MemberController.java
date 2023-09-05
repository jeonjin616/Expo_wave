package com.multi.wave.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
		System.out.println(mem_id);	// 사용자가 입력한 id 이클립스 콘솔에 출력	
		return service.memidCheck(mem_id);
	}
	
	// 회원 가입 
	@RequestMapping("member/insert")
	public String insert(MemberVO vo){
		vo.setMem_email(vo.getMemEmail() + '@' + vo.getDomainList());
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
	
	/*
	 *  이메일 인증버튼 요청 클릭
	 */	
	// 1-1. 이름과 이메일 확인
	@RequestMapping("member/nameCheck")
	@ResponseBody
	public String nameCheck(MemberVO vo) {
		String data = service.nameCheck(vo);
		return data;
	}
	
	// 1-2. 이메일 인증번호 전송
	@RequestMapping("member/idCertNumByEmail")
	@ResponseBody
	public String idCertNumByEmail(String mem_email) {
		System.out.println("인증 이메일 : " + mem_email);
		return service.certNumEmail(mem_email);	
	}
	
	// 1-3. 아이디 찾기 결과 페이지 열기
	// PathVariable : URI에 있는 변수의 값을 가져옴
	@RequestMapping("member/idSearchRes/{mem_email}/{mem_name}")
	public String idSearchRes(@PathVariable("mem_email") String mem_email,
							  @PathVariable("mem_name") String mem_name, Model model) {
	// RequestParam 버전
//	@RequestMapping("member/idSearchRes")
//	public String idSearchRes(@RequestParam("mem_name") String mem_name,
//							  @RequestParam("mem_email") String mem_email, Model model) {
		MemberVO memInfo = new MemberVO();
		memInfo.setMem_name(mem_name);
		memInfo.setMem_email(mem_email);
		memInfo.setMem_id(dao.knowId(memInfo));
		model.addAttribute("memInfo", memInfo);
		return "member/idSearchResult";
	}
	
	// 네이버 소셜 로그인 가입 유무 체크
	@RequestMapping("member/naverEmailChk")
	@ResponseBody
	public String naverEmailChk(@RequestParam("mem_email") String mem_email,
			HttpSession session) {
		System.out.println(mem_email);
		String mem_id = service.naverEmailChk(mem_email);
		String result = "not exist";
		if(mem_id != null) {
			result = "exist";
			session.setAttribute("loginMember", mem_id);
		}
		return result;
	}
	
	// 네이버 소셜 로그인을 통한 회원가입(추가정보 기입)
	@RequestMapping("member/naverInsert")
	public String naverInsert(MemberVO vo){
		service.naverJoin(vo);
		return "redirect:../index.jsp";
	}
	
	
	
}
