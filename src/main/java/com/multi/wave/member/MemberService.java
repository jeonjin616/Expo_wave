package com.multi.wave.member;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	MemberDAO dao;
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	// 이메일 인증번호 관련
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int certNumber;	// 인증번호

	
	// id 중복 체크(서비스 생성 권장 X)
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
		System.out.println("서비스 vo 출력 : " + vo.getMem_id());
		System.out.println("dao에서 받은 비밀번호 출력 : " + getPw);
		if(getPw != null & pwEncoder.matches(vo.getMem_pw(), getPw)){	
			return true;
		}
		return false;
	}
	
	// 이메일 인증번호 요청하기
	// 1-1. 이름과 이메일 체크
	public String nameCheck(MemberVO vo) {
		String getEmail = dao.nameCheck(vo);
		System.out.println("vo 출력 : " + vo.getMem_name());
		System.out.println("dao 에서 받은 이메일 출력 : " + getEmail);
		if(!getEmail.equals("fail") & vo.getMem_email().equals(getEmail)) {
			return "true";
		}
		return "false";
	}
	
	// 1-2. 인증번호 생성
	public void createRandomCertNum() {
		Random r = new Random();
		int certNum = r.nextInt(888888)+111111;	// 6자리 난수 발생. 범위는 111111 ~ 999999
		System.out.println("생성된 인증번호 : " + certNum);
		certNumber = certNum;
	}
	
	// 1-3. 이메일 전송(이메일 양식 지정)
	public String certNumEmail(String email) {
		createRandomCertNum();	// 난수 생성
		String setFrom = "as26149z@gmail.com";	// mail-config에서 설정한 username 입력
		String setTo = email;	// 수신자
		String title = "[Wave] 아이디 찾기 인증번호 메일입니다.";	// mail 제목
		// 메일 본문(html 형식으로 작성해야 함)
		String content = 
			"<br>"
			+ "인증번호는 <strong color='blue'>" + 
			certNumber + "</strong> 입니다.<br>";
		mailSend(setFrom, setTo, title, content);
		return Integer.toString(certNumber);
	}
	
	// 1-4. 이메일 전송 메소드(mailSead) 설정
	public void mailSend(String setFrom, String setTo, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(setTo);
			helper.setSubject(title);
			helper.setText(content, true); // true로 전달 : html 형식으로 전달하겠다.
			mailSender.send(message);
		} catch(MessagingException e) {
			e.printStackTrace();
		}
	}
	
	// 네이버 소셜 로그인 가입 유무 체크
	public String naverEmailChk(String mem_email) {
		String mem_id = dao.naverEmailChk(mem_email);
		return mem_id;
	}
	
	// 네이서 소셜 로그인 회원가입
	public void naverJoin(MemberVO vo) {
		// 입력받은 pw(get)를 암호화(encode)하여 pw를 설정(set)한다.
		vo.setMem_pw(pwEncoder.encode(vo.getMem_pw()));
		dao.naverInsert(vo);
	}
	
}
