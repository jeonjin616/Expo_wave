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
		String getPw = my.selectOne("member.pwCheck", vo);
		System.out.println("매퍼에서 받은 비밀번호 출력 : " + getPw);
		if(getPw != null) {
			return getPw;	
		}
		return "null";	// null을 스트링으로 만들어 리턴
	}
	
}