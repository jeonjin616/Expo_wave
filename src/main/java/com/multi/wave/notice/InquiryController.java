package com.multi.wave.notice;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class InquiryController {
    private final InquiryService inquiryService;

    @Autowired
    public InquiryController(InquiryService inquiryService) {
        this.inquiryService = inquiryService;
    }

    
    // 실제 글 작성 처리하는 메서드 (수정 필요)
    @PostMapping("notice/inquiry")
    public String writeInquiry(@RequestParam("file") MultipartFile file, @RequestParam("inqu_title") String inqu_title,
			@RequestParam("inqu_content") String inqu_content, Model model) throws Exception {
    	String savedName = file.getOriginalFilename();

		String uploadPath = "C:\\Users\\User\\Documents\\workspace-sts-3.9.12.RELEASE\\Expo_wave333\\src\\main\\webapp\\resources\\img";
		File target = new File(uploadPath + "/" + savedName);

		file.transferTo(target);

		model.addAttribute("savedName", savedName);

		// 이 부분에서 BoardVO 객체를 생성하고 필드를 채워넣어야 합니다.
		InquiryVO dto = new InquiryVO();
		dto.setInqu_title(inqu_title);
		dto.setInqu_content(inqu_content);
		dto.setImg(savedName);
		
		
        inquiryService.writeInquiry(dto);
        return "redirect:notice/inqu";
    }
}