package com.multi.wave.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InquiryService {
    private final InquiryDAO inquiryDAO;

    @Autowired
    public InquiryService(InquiryDAO inquiryDAO) {
        this.inquiryDAO = inquiryDAO;
    }

    public void writeInquiry(InquiryVO inquiryDTO) {
        inquiryDAO.insertInquiry(inquiryDTO);
    }
}
