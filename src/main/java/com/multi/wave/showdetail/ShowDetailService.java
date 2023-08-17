package com.multi.wave.showdetail;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShowDetailService {

    @Autowired
    private ShowDetailDAO showDAO;

    
    public ShowDetailVO selectShow(String show_id) {
        return showDAO.selectOne(show_id);
    }
    
    public List<ShowDetailVO> selectRecommendedShow(String show_genre) {
        List<ShowDetailVO> allShow = showDAO.selectByGenre(show_genre); // 해당 타입의 공연 목록 조회
        Collections.shuffle(allShow); // 공연 목록을 무작위로 섞음
        return allShow.subList(0, Math.min(3, allShow.size())); // 최대 3개의 공연을 반환
    }
}
