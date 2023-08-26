package com.multi.wave.festivaldetail;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FestivalDetailDAO {

	@Autowired
	private SqlSession my;

	
    public FestivalDetailVO selectOne(String fsv_id) {
        return my.selectOne("com.multi.wave.festivaldetail.FestivalDetailMapper.selectOne", fsv_id);
    }
    
    public List<FestivalDetailVO> selectByDate(String fsv_start) {
    	return my.selectList("com.multi.wave.festivaldetail.FestivalDetailMapper.selectByDate", fsv_start);
    }

}
