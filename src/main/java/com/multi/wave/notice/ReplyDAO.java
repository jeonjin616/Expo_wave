package com.multi.wave.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {
    
    @Autowired
    private SqlSession sqlSession;
    
    public List<ReplyVO> getRepliesByPostId(int postId) {
        return sqlSession.selectList("reply.getRepliesByPostId", postId);
    }
    
    public void insertReply(ReplyVO reply) {
        sqlSession.insert("reply.insertReply", reply);
    }
}