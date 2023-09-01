package com.multi.wave.notice;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class ChatBotService {
    @Autowired
    private ChatBotDAO chatBotDAO;
    public List<String> getFestivalsByRegion(String region) {
        List<String> festivals = chatBotDAO.findFestivalsByRegion(region);
        System.out.println("Festivals: " + festivals);  // ·Î±ë
        return festivals;
    }
    
    public List<String> getShowByRegion(String region) {
        List<String> show = chatBotDAO.findShowByRegion(region);
        System.out.println("show: " + show);  // ·Î±ë
        return show;
    }
    
    
}