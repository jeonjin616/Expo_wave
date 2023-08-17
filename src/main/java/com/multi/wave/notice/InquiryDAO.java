package com.multi.wave.notice;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InquiryDAO {
    private final SqlSession sqlSession;

    @Autowired
    public InquiryDAO(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public void insertInquiry(InquiryVO inquiryDTO) {
        sqlSession.insert("com.yourpackage.InquiryDAO.insertInquiry", inquiryDTO);
    }
}