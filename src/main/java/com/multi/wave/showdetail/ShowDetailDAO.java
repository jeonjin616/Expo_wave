package com.multi.wave.showdetail;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShowDetailDAO {

    @Autowired
    private SqlSessionTemplate my;

    public ShowDetailVO selectOne(String show_id) {
        return my.selectOne("com.multi.wave.showdetail.showDetailMapper.selectOne", show_id);
    }

    public List<ShowDetailVO> selectByGenre(String show_genre) {
        return my.selectList("com.multi.wave.showdetail.showDetailMapper.selectByGenre", show_genre);
    }
}
