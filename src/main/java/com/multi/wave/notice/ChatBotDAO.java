package com.multi.wave.notice;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;
@Repository
public class ChatBotDAO {
    @Autowired
    private SqlSession my;
    
    public List<String> findFestivalsByRegion(String region) {
        return my.selectList("chatBotMapper.findFestivalsByRegion", region);
    }
    
    
    public List<String> findShowByRegion(String region) {
        return my.selectList("chatBotMapper.findShowByRegion", region);
    }
}