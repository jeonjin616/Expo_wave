package com.multi.wave.notice;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ReplyController {

    @Autowired
    private ReplyDAO replyDAO;

    @GetMapping("notice/replies/{post_id}")
    public List<ReplyVO> getRepliesByPostId(@PathVariable("post_id") int postId) {
        return replyDAO.getRepliesByPostId(postId);
    }

    @PostMapping("notice/replies")
    public ResponseEntity<String> insertReply(ReplyVO reply, HttpServletRequest request) {
        try {
            // 세션에서 loginMember 가져오기
            String loginMember = (String) request.getSession().getAttribute("loginMember");
            
            // ReplyVO에 writer 설정
            reply.setWriter(loginMember);
            
            replyDAO.insertReply(reply);
            return ResponseEntity.ok("댓글 작성 완료");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("댓글 작성 중 오류 발생");
        }
    }
    
    @RequestMapping(value = "notice/updateReply", method = RequestMethod.POST)
    @ResponseBody
    public String updateReply(@RequestParam("replyId") int replyId, 
            @RequestParam("content") String newContent,
            @RequestParam("reg_date") String regDate) {
    	
    	Map<String, Object> params = new HashMap<>();
    	params.put("replyId", replyId);
    	params.put("newContent", newContent);
    	params.put("regDate", regDate);  // 여기에 reg_date 추가

    	int updateResult = replyDAO.updateReply(params);
    	return updateResult == 1 ? "success" : "fail";
    }
    
    @DeleteMapping("notice/deleteReply/{reply_id}")
    public ResponseEntity<String> deleteReply(@PathVariable("reply_id") int replyId) {
        try {
            replyDAO.deleteReply(replyId);
            return ResponseEntity.ok("댓글 삭제 완료");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("댓글 삭제 중 오류 발생");
        }
    }
}