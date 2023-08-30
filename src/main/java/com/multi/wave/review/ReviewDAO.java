package com.multi.wave.review;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public void insert(ReviewVO reviewVO) {
		my.insert("review.insert", reviewVO);
	}
	
	public void update(ReviewVO reviewVO) {
		my.update("review.update", reviewVO);
	}
	
	public List<ReviewVO> list() {
		List<ReviewVO> list = my.selectList("review.list");
		return list;
	}
	public ReviewVO one(int review_id) {
		System.out.println("2>> " + review_id);
		ReviewVO one = my.selectOne("review.one", review_id);
		return one;
	}
	
}
