package com.multi.wave.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	// 회원가입
	public int insert(MemberVO vo) {
		return my.insert("member.insert", vo);
	}
	
	// 아이디 중복 체크
	public String memidCheck(String mem_id) {
		return my.selectOne("member.memidCheck", mem_id);
	}
	
	// 로그인
	public String login(MemberVO vo) {
		String getPw = my.selectOne("member.memberLogin", vo);
		System.out.println("id : " + vo.getMem_id());
		System.out.println("매퍼에서 받은 비밀번호 출력 : " + getPw);
		if(getPw != null) {
			return getPw;	
		}
		return "null";	// null을 스트링으로 만들어 리턴
	}
	
	// 이메일 인증번호 요청하기
	// 1-1. 이름과 이메일 체크
	public String nameCheck(MemberVO vo) {
		String get_email = my.selectOne("member.idInfoCheck",vo);
		System.out.println("이름 : " + vo.getMem_name());
		System.out.println("매퍼에서 받은 이메일 : " + get_email);
		if(get_email != null) {
			return get_email;
		}
		return "fail";
	}
	
	// 1-2. 아이디 알려주기
	public String knowId(MemberVO vo) {
		return my.selectOne("member.knowId", vo);
	}
	
	// 네이버 소셜 로그인 이메일 체크
	public String naverEmailChk(String mem_email) {
		return my.selectOne("member.naverEmailChk", mem_email);
	}
	
	// 네이버 소셜 로그인 회원가입
	public int naverInsert(MemberVO vo) {
		return my.insert("member.naverInsert", vo);
	}
}