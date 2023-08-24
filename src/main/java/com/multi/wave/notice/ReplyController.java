package com.multi.wave.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/replies")
public class ReplyController {
    @Autowired
    private ReplyDAO dao;

    // "/{post_id}" 경로를 추가해줍니다.
    @PostMapping("/{post_id}")
    public void create(@PathVariable int post_id, @RequestParam String content) {
        ReplyVO replyVO = new ReplyVO();
        replyVO.setPostId(post_id);
        replyVO.setContent(content);
        
        System.out.println(replyVO);
        dao.create(replyVO); // DB에 추가
    }

    @GetMapping("/{post_id}")
    public List<ReplyVO> list(@PathVariable int post_id) {
        return dao.list(post_id);
    }
}
