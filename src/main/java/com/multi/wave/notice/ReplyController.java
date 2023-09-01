package com.multi.wave.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
    public void insertReply(@RequestBody ReplyVO reply) {
        replyDAO.insertReply(reply);
    }
}
