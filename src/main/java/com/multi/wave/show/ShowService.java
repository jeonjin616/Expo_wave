package com.multi.wave.show;

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
    
    public void insert(ShowVO vo) {
        showDAO.insert(vo);
        
    }
    
   // @Scheduled(fixedRate = 180000) // 1분마다 실행 , 60000(1분) 
    @Scheduled(cron = "0 0 4 * * ?") // 4:00 AM 매일 실행됨
    public void fetchDataAndInsert() {
        try {
        	
        	 // 기존 데이터 삭제
            showDAO.deleteAll();
            
            // 데이터를 받아오는 로직을 호출
            List<ShowVO> fetchedData = parser.parse(1);

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
    
    
    public List<ShowVO> list() {
        return showDAO.list();
    }
}

