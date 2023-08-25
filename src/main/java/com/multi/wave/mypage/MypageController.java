package com.multi.wave.mypage;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.multi.wave.member.MemberVO;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private MypageService mypageService;

	@Autowired
	private PasswordEncoder pwEncoder;

	@Autowired
	private ServletContext servletContext;

	@PostMapping("/uploadProfileImage")
	@ResponseBody
	public String uploadProfileImage(@RequestParam("file") MultipartFile file, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		if (!file.isEmpty()) {
			try {
				String filename = file.getOriginalFilename();
				String realPath = servletContext.getRealPath("/resources/img/profileImg/") + filename;
				File dest = new File(realPath);

				// 기존 프로필 사진 파일 삭제 (선택 사항)
				String oldFilename = member.getMem_img();
				if (oldFilename != null && !oldFilename.isEmpty()) {
					String oldFilePath = servletContext.getRealPath("/resources/img/profileImg/") + oldFilename;
					File oldFile = new File(oldFilePath);
					oldFile.delete();
				}

				// 새 프로필 사진 파일 저장
				file.transferTo(dest);

				// DB에 파일명 업데이트
				mypageService.updateProfileImage(member.getMem_id(), filename);

				return "success";
			} catch (Exception e) {
				e.printStackTrace();
				return "error";
			}
		} else {
			return "empty";
		}
	}

	@GetMapping
	public String showMypage(HttpSession session, Model model) {
		String mem_id = (String) session.getAttribute("loginMember"); // 세션에서 아이디 가져오기
		if (mem_id != null) {
			MemberVO member = mypageService.getMemberById(mem_id); // 아이디를 이용해 전체 회원 정보 가져오기
			session.setAttribute("member", member); // 세션에 멤버 정보 저장
			model.addAttribute("mem_id", member.getMem_id());
			model.addAttribute("mem_name", member.getMem_name());
			model.addAttribute("mem_nickname", member.getMem_nickname());
			model.addAttribute("mem_joy1", member.getMem_joy1());
			model.addAttribute("mem_joy2", member.getMem_joy2());
			model.addAttribute("mem_pw", member.getMem_pw());
		}
		return "mypage/mypage"; // JSP 페이지 경로
	}

	@PostMapping("/changePassword") // URL 경로 수정
	@ResponseBody // Ajax 요청에 대한 응답을 직접 반환하도록 설정
	public String changePassword(String oldPassword, String newPassword, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");

		if (pwEncoder.matches(oldPassword, member.getMem_pw())) { // 비밀번호가 맞는 경우
			String encodedNewPassword = pwEncoder.encode(newPassword);
			mypageService.changePassword(member.getMem_id(), encodedNewPassword);
			return "success"; // 변경 성공 시 success 반환
		} else { // 비밀번호가 틀린 경우
			return "error"; // 변경 실패 시 error 반환
		}
	}

}
