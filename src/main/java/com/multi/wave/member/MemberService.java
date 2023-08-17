package com.multi.wave.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	MemberDAO dao;
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	// id 중복 체크(서비스 생성을 권장 X)
	public String memidCheck(String mem_id) {
		String mem_id2 = dao.memidCheck(mem_id);
		System.out.println(mem_id2);
		String result =  "no";
		if(mem_id2!=null) {
			result = "yes";
		}
		return result;
	}
	
	// pw 암호화해서 회원가입하기
	public void join(MemberVO vo) {
		// 입력받은 pw(get)를 암호화(encode)하여 pw를 설정(set)한다.
		vo.setMem_pw(pwEncoder.encode(vo.getMem_pw()));
		dao.insert(vo);
	}
	
	// 로그인 하기
	public boolean login(MemberVO vo) {
		String getPw = dao.login(vo);
		System.out.println("dao에서 받은 비밀번호 출력 : " + getPw);
		if(pwEncoder.matches(vo.getMem_pw(), getPw)){	
			return true;
		}
		return false;
	}
	

}
