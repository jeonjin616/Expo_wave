package com.multi.wave;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.wave.review.ReviewVO;

@Repository
public class MainDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public List<MainFestivalVO> list() {
		List<MainFestivalVO> list = my.selectList("main.festival");
		return list;
	}
	
	public List<MainShowVO> list2() {
		List<MainShowVO> list2 = my.selectList("main.show");
		return list2;
	}
}
