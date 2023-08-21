package com.multi.wave.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/replies")
public class ReplyController {
    @Autowired
    private ReplyDAO replyDAO;

    @PostMapping
    public void create(@RequestBody ReplyVO replyVO) {
        System.out.println(replyVO); // 諛???媛 濡源
        replyDAO.create(replyVO);
    }

    @GetMapping("/{post_id}")
    public List<ReplyVO> list(@PathVariable int post_id) {
        return replyDAO.list(post_id);
    }
}