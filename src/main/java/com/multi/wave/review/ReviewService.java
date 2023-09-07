package com.multi.wave.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.wave.festival.FestivalVO;
import com.multi.wave.show.ShowVO;

@Service
public class ReviewService {
	
	@Autowired
	ReviewDAO reviewDAO;
	
	public void insert(ReviewVO reviewVO) {
		reviewDAO.insert(reviewVO);
	}
	
	public void update(ReviewVO reviewVO) {
		reviewDAO.update(reviewVO);
	}
	
	public List<ReviewVO>  list() {
		return reviewDAO.list();
	}
	
	public List<ReviewVO>  list_fsv() {
		return reviewDAO.list_fsv();
	}
	
	public List<ReviewVO>  list_show() {
		return reviewDAO.list_show();
	}
	
	public List<FestivalVO>  search_fsv(String q) {
		return reviewDAO.search_fsv(q);
	}
	
	public List<ShowVO>  search_show(String q) {
		return reviewDAO.search_show(q);
	}
	
	public ReviewVO one(int review_id) {
		return reviewDAO.one(review_id);
	}
	
	public void delete(int review_id) {
		reviewDAO.delete(review_id);
	}
	
	
}
