package com.multi.wave.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	public ReviewVO one(int review_id) {
		return reviewDAO.one(review_id);
	}
}
