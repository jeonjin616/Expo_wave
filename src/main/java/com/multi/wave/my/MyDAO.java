package com.multi.wave.my;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.wave.my.MyVO;

@Repository
public class MyDAO {

	@Autowired
	SqlSessionTemplate my;
	
    public List<MyVO> list() {
        return my.selectList("my.list");
    }
    
    public List<MyVO> list(String find) {
        return my.selectList("my.list2", find);
    }
    
}
