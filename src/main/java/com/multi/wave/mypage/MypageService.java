package com.multi.wave.mypage;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.multi.wave.member.MemberVO;

@Service
public class MypageService {

	@Autowired
	private MypageDAO mypageDAO;

	public void changePassword(String mem_id, String newPassword) {
		mypageDAO.changePassword(mem_id, newPassword);
	}

	public MemberVO getMemberById(String mem_id) {
		return mypageDAO.getMemberById(mem_id);
	}

	
	public void updateProfileImage(String mem_id, String filename) {
	    mypageDAO.updateProfileImage(mem_id, filename);
	}
}
