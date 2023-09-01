package com.multi.wave.show;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
@EnableScheduling
public class ShowService {




    @Autowired
    ShowDAO showDAO;
    
    @Autowired
    ShowParser parser;
    
	/*
	 * @Value("${show.serviceKey}") // Import this annotation private String key; //
	 * Define a field to hold the serviceKey value
	 * 
	 */
    public void insert(ShowVO vo) {
        showDAO.insert(vo);
        
    }
    
    //@Scheduled(fixedRate = 300000) // 1분마다 실행 , 60000(1분) 
    @Scheduled(cron = "0 0 4 1/30 * ?") // 30일 마다  4:00 AM 
    public void fetchDataAndInsert() {
        try {
        	
        	 // 기존 데이터 삭제
            showDAO.deleteAll();
            
            // 데이터를 받아오는 로직을 호출
            List<ShowVO> fetchedData = parseAndFilter(1);

            // 받아온 데이터 처리 또는 저장하는 로직을 추가
            for (ShowVO data : fetchedData) {
                // 데이터 변환 및 저장 로직
                showDAO.insert(data);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // 예외 처리 로직 추가
        }
    }
    //중복 필터
    public List<ShowVO> parseAndFilter(int limit) throws Exception {
	    List<ShowVO> fetchedData = parser.parse(limit);
	    List<ShowVO> filteredData = new ArrayList<>();

	    for (ShowVO data : fetchedData) {
	        if (!isDataAlreadyExists(data)) {
	            filteredData.add(data);
	        }
	    }

	    return filteredData;
	}
    //중복확인
    private boolean isDataAlreadyExists(ShowVO data) { 
		 List<ShowVO> existingData = showDAO.search(data.getShow_name()); 
		 return !existingData.isEmpty(); }
    
    public List<ShowVO> list() {
        return showDAO.list();
    }
    
    public List<ShowVO> search(String query) {
        return showDAO.search(query);
    }
    
    public List<ShowVO> searchlist(Page1VO vo) {
        return showDAO.searchlist(vo);
    }
}

