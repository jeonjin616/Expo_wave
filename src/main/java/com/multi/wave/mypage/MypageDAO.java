package com.multi.wave.mypage;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.wave.member.MemberVO;

@Repository
public class MypageDAO {

	@Autowired
	private SqlSession my;

	public void changePassword(String mem_id, String newPassword) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("mem_id", mem_id);
		paramMap.put("newPassword", newPassword);
		my.update("mypageMapper.changePassword", paramMap);
	}

	public MemberVO getMemberById(String mem_id) {
		return my.selectOne("mypageMapper.getMemberById", mem_id);
	}

	public void updateProfileImage(String mem_id, String filename) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("mem_id", mem_id);
		paramMap.put("filename", filename);
		my.update("mypageMapper.updateProfileImage", paramMap);
	}

}
