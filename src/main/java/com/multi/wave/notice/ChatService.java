package com.multi.wave.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatService {

    @Autowired
    private ChatDAO chatDAO;

    public List<ChatVO> recommendFestivalsByTheme(String theme) {
        return chatDAO.findFestivalsByTheme(theme);
    }

    public List<ChatVO> recommendRandomPerformancesByTheme(String theme) {
        return chatDAO.findRandomPerformancesByTheme(theme, 5); // �������� 5���� ������ ��õ
    }
}
