package com.multi.wave.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("notice")
public class ChatController {

    @Autowired
    private ChatService chatService;

    @GetMapping("notice/recommend")
    public String showRecommendationPage() {
        return "recommendation";
    }

    @PostMapping("notice/recommend/festivals")
    public String recommendFestivals(@RequestParam("keyword") String keyword, Model model) {
        List<ChatVO> recommendedFestivals = chatService.recommendFestivalsByTheme(keyword);
        model.addAttribute("festivals", recommendedFestivals);
        return "festival_recommendation_result";
    }

    @PostMapping("notice/recommend/performances")
    public String recommendPerformances(@RequestParam("theme") String theme, Model model) {
        List<ChatVO> recommendedPerformances = chatService.recommendRandomPerformancesByTheme(theme);
        model.addAttribute("performances", recommendedPerformances);
        return "performance_recommendation_result";
    }
    
    @GetMapping("chat") 
    public String list(Model model) {
        return "notice/chat";
    }
}
