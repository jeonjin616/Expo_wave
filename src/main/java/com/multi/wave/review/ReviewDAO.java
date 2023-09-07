package com.multi.wave.review;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.wave.festival.FestivalVO;
import com.multi.wave.show.ShowVO;

@Repository
public class ReviewDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public void insert(ReviewVO reviewVO) {
		my.insert("review.insert", reviewVO);
	}
	
	public void update(ReviewVO reviewVO) {
		System.out.println("3 >>>" + reviewVO);
		my.update("review.update", reviewVO);
	}
	
	public List<ReviewVO> list() {
		List<ReviewVO> list = my.selectList("review.list");
		return list;
	}
	
	public List<ReviewVO> list_fsv() {
		List<ReviewVO> list = my.selectList("review.list_fsv");
		return list;
	}
	
	public List<ReviewVO> list_show() {
		List<ReviewVO> list = my.selectList("review.list_show");
		return list;
	}
	
	public List<FestivalVO> search_fsv(String q) {
		List<FestivalVO> list = my.selectList("review.search_fsv", q);
		return list;
	}
	
	public List<ShowVO> search_show(String q) {
		List<ShowVO> list = my.selectList("review.search_show", q);
		return list;
	}
	
	public ReviewVO one(int review_id) {
		System.out.println("2>> " + review_id);
		ReviewVO one = my.selectOne("review.one", review_id);
		return one;
	}
	
	public void delete(int review_id) {
		System.out.println("delte >> " + review_id);
		my.delete("review.delete", review_id);
	}
	
}
