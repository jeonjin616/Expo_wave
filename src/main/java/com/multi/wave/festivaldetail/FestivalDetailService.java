package com.multi.wave.festivaldetail;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FestivalDetailService {

	@Autowired
	private FestivalDetailDAO festivalDAO;
	
    public FestivalDetailVO selectFestival(String fsv_id) {
        return festivalDAO.selectOne(fsv_id);
    }
    
    public List<FestivalDetailVO> selectRecommendedFestival(String fsv_start) {
        List<FestivalDetailVO> allFestival = festivalDAO.selectByDate(fsv_start); // 해당 타입의 공연 목록 조회
        Collections.shuffle(allFestival); // 공연 목록을 무작위로 섞음
        return allFestival.subList(0, Math.min(3, allFestival.size())); // 최대 3개의 공연을 반환
    }

}
