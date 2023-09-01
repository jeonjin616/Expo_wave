package com.multi.wave.festival;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.wave.show.Page1VO;
import com.multi.wave.show.ShowVO;

@Repository
public class FestivalDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public void insert(FestivalVO vo) {
		my.insert("festival.insert", vo);
	}
	
	public void deleteAll() {
		my.delete("festival.deleteAll");
	}

    public List<FestivalVO> list() {
        return my.selectList("festival.list");
    }
   
    public List<FestivalVO> all(PageVO vo) {
		return my.selectList("festival.all", vo);
	}
	
	public List<FestivalVO> list2(PageVO vo) {
		return my.selectList("festival.list2", vo);
	}
	
	public int count() {
		return my.selectOne("festival.count");
	} 
	

	public List<FestivalVO> search(String query) {
	    return my.selectList("festival.search", "%" + query + "%");
	}
	public List<FestivalVO> searchlist(PageVO vo) {
		return my.selectList("festival.searchlist", vo);
	}
    
}


