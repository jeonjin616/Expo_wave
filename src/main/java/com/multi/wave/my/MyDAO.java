package com.multi.wave.my;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	/*
	 * public List<MyVO2> list2() { return my.selectList("my.list3"); }
	 *
	 * public List<MyVO2> list2(String find2) { return my.selectList("my.list4",
	 * find2); }
	 */

}
