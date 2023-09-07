package com.multi.wave.notice;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
@CrossOrigin(origins = "*") // CORS 설정 추가
public class ChatBotController {
   
    @Autowired
    private ChatBotService chatBotService;
    @RequestMapping("notice/chat")
    public String showChatBot() {
        return "notice/chatbot";
    }
    @ResponseBody
    @RequestMapping("notice/getFestivals")
    public List<String> getFestivals(@RequestParam String region) {
        return chatBotService.getFestivalsByRegion(region);
    }
    
    @ResponseBody
    @RequestMapping("notice/getShow")
    public List<String> getShow(@RequestParam String region) {
        return chatBotService.getShowByRegion(region);
    }
}