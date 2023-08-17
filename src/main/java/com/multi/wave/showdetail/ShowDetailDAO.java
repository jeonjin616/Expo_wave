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
        return my.selectOne("ShowDetailMapper.selectOne", show_id);
    }

    public List<ShowDetailVO> selectByGenre(String show_genre) {
        return my.selectList("ShowDetailMapper.selectByGenre", show_genre);
    }
}
