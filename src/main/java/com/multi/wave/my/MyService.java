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

    public List<MyVO> list(String find) {
        return myDAO.list(find);
    }

/*    public List<MyVO2> list2() {
        return myDAO.list2();
    }

    public List<MyVO2> list2(String find2) {
        return myDAO.list2(find2);*/
    }
