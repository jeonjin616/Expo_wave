package com.multi.wave.festival;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
@EnableScheduling
public class FestivalService {

	@Autowired
	FestivalDAO festivalDAO;
	
	@Autowired
	FestivalParser parser;
	
	/*
	 * @Value("${festival.serviceKey}") // Import this annotation private String
	 * key; // Define a field to hold the serviceKey value
	 */
	public void insert(FestivalVO vo) {
		festivalDAO.insert(vo);
	}
	//@Scheduled(fixedRate = 180000) // 1분마다 실행 , 60000(1분) 
	@Scheduled(cron = "0 0 4 * * *") // 4:00 AM 
	public void fetchDataAndInsert() {
	    try {
	    	// 기존 데이터 삭제
	        festivalDAO.deleteAll();
	        
	        // 데이터를 받아오는 로직을 호출하고 중복 여부를 확인하여 필터링

	        List<FestivalVO> fetchedData = parseAndFilter(1);
	        
	        // 받아온 데이터 처리 또는 저장하는 로직을 추가
	        for (FestivalVO data : fetchedData) {
	            festivalDAO.insert(data);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        // 예외 처리 로직 추가
	    }
	}
	public List<FestivalVO> parseAndFilter(int limit) throws Exception {
	    List<FestivalVO> fetchedData = parser.parse(limit);
	    List<FestivalVO> filteredData = new ArrayList<>();

	    for (FestivalVO data : fetchedData) {
	        if (!isDataAlreadyExists(data)) {
	            filteredData.add(data);
	        }
	    }

	    return filteredData;
	}
	
	 private boolean isDataAlreadyExists(FestivalVO data) { 
		 List<FestivalVO> existingData = festivalDAO.search(data.getFsv_name()); 
		 return !existingData.isEmpty(); }
	 
	public void deleteAll() {
		festivalDAO.deleteAll();
	}
	
	  public List<FestivalVO> list() {
	        return festivalDAO.list();
	    }
	  
	
	    
	    public List<FestivalVO> search(String query) {
	        return festivalDAO.search(query);
	    }
	    
	    public List<FestivalVO> searchlist(PageVO vo) {
	        return festivalDAO.searchlist(vo);
	    }
	}

