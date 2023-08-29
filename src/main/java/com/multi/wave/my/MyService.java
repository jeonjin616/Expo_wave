package com.multi.wave.my;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyService {

    @Autowired
    MyDAO myDAO;
    
    public List<MyVO> list() {
        return myDAO.list();
    }
}
