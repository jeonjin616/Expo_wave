package com.multi.wave;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.wave.review.ReviewDAO;
import com.multi.wave.review.ReviewVO;

@Service
public class MainService {

	@Autowired
	MainDAO MainDAO;
	
	public List<MainFestivalVO>  list() {
		return MainDAO.list();
	}
	
	public List<MainShowVO>  list2() {
		return MainDAO.list2();
	}
	
}
