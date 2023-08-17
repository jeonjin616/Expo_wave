package com.multi.wave.show;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShowDAO {

	   @Autowired
	    SqlSessionTemplate my;
	    
	    public void insert(ShowVO vo) {
	    	
	        my.insert("show.insert", vo);
	    }
	    
	    public void deleteAll() {
	        my.delete("show.deleteAll");
	    }
	    
	    
	    public List<ShowVO> list() {
	        return my.selectList("show.list");
	    }
	    
	    
}
