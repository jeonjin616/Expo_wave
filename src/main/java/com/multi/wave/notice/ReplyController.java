package com.multi.wave.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public ResponseEntity<String> insertReply(ReplyVO reply) {
        try {
            replyDAO.insertReply(reply);
            return ResponseEntity.ok("��� �ۼ� �Ϸ�");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("��� �ۼ� �� ���� �߻�");
        }
    }
    
    @RequestMapping(value = "/updateReply", method = RequestMethod.POST)
    @ResponseBody
    public String updateReply(@RequestParam("replyId") int replyId, @RequestParam("content") String newContent) {
        Map<String, Object> params = new HashMap<>();
        params.put("replyId", replyId);
        params.put("newContent", newContent);
        
        int updateResult = replyDAO.updateReply(params);
        return updateResult == 1 ? "success" : "fail";
    }
    
    @DeleteMapping("notice/deleteReply/{reply_id}")
    public ResponseEntity<String> deleteReply(@PathVariable("reply_id") int replyId) {
        try {
            replyDAO.deleteReply(replyId);
            return ResponseEntity.ok("��� ���� �Ϸ�");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("��� ���� �� ���� �߻�");
        }
    }
}