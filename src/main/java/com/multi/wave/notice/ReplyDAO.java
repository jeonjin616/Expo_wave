package com.multi.wave.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {
    @Autowired
    private SqlSession sqlSession;

    public void create(ReplyVO vo) {
        sqlSession.insert("ReplyMapper.create", vo);
    }

    public List<ReplyVO> list(int post_id) {
        return sqlSession.selectList("ReplyMapper.list", post_id);
    }
}