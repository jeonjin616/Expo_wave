package com.multi.wave.festival;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.multi.wave.show.Page1VO;
import com.multi.wave.show.ShowVO;

@Service
@EnableScheduling
public class FestivalService {

	@Autowired
	FestivalDAO festivalDAO;
	
	@Autowired
	FestivalParser parser;
	
	public void insert(FestivalVO vo) {
		festivalDAO.insert(vo);
	}
	//@Scheduled(fixedRate = 3600000) // 1분마다 실행 , 60000(1분) 
	  @Scheduled(cron = "0 0 4 * * ?") // Run at 4:00 AM every day
	public void fetchDataAndInsert() {
		try {
			
			// 기존 데이터 삭제
			festivalDAO.deleteAll();
			
			// 데이터를 받아오는 로직을 호출
			List<FestivalVO> fetchedData = parser.parse(1);
			
			// 받아온 데이터 처리 또는 저장하는 로직을 추가
			for (FestivalVO data : fetchedData) {
				// 데이터 변환 및 저장 로직
				festivalDAO.insert(data);
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			// 예외 처리 로직 추가
		}
	}
	
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

