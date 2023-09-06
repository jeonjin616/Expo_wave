package com.multi.wave.notice;

import java.util.List;
import java.util.Map;

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
    
    public int updateReply(Map<String, Object> params) {
        return sqlSession.update("reply.updateReply", params);
    }
    
    public int deleteReply(int replyId) {
        return sqlSession.delete("deleteReply", replyId);
    }
}