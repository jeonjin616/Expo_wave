package com.multi.wave.notice;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class BoardController {

	@Autowired
	BoardDAO dao;
	
	@RequestMapping("notice/insert")
	public void insert(BoardVO dto) {
		int result = dao.insert(dto);
	}
	
	@RequestMapping("notice/insert2")
	public String insert2(@RequestParam("file") MultipartFile file,
	                      @RequestParam("board_title") String title,
	                      @RequestParam("board_content") String content,
	                      RedirectAttributes redirectAttributes,
	                      Model model)throws Exception {
		
			String test = UUID.randomUUID().toString();
            String savedName = test+"_"+file.getOriginalFilename();

            String uploadPath = "C:\\Users\\User\\Documents\\workspace-sts-3.9.12.RELEASE\\Expo_wave555\\src\\main\\webapp\\resources\\upload";
            File target = new File(uploadPath + "/" + savedName);
            
            file.transferTo(target);

			/* model.addAttribute("savedName", savedName); */



            BoardVO dto = new BoardVO();
            dto.setBoard_title(title);
            dto.setBoard_content(content);
            dto.setImg(savedName);
            
            
            dao.insert(dto);
            redirectAttributes.addFlashAttribute("message", "추가가 완료되었습니다."); 
            return "redirect:notice";

    }
	
	@GetMapping("notice/edit")
	public String edit(@RequestParam("board_id") int board_id, Model model) {
		BoardVO dto = dao.oneById(board_id); // 새로운 메서드 호출
		model.addAttribute("dto", dto);
		return "notice/update"; // 수정 페이지로 이동
	}

	// 수정 작업을 처리하는 메서드
	@PostMapping("notice/update_action")
	public String update(@RequestParam("file") MultipartFile file, @RequestParam("board_id") int boardId, 
			@RequestParam("board_title") String title, @RequestParam("board_content") String content,
			RedirectAttributes redirectAttributes) throws Exception {

		BoardVO dto = new BoardVO();
		dto.setBoard_id(boardId); // id를 설정
		dto.setBoard_title(title); // title 설정
		dto.setBoard_content(content); // question 설정

		BoardVO existingBoard = dao.oneById(boardId); // 파라미터로 받은 id를 사용

		if (existingBoard != null) {
			String test = UUID.randomUUID().toString();
			String savedName = (file != null && !file.isEmpty()) ? test+"_"+file.getOriginalFilename() : "";
			if (!savedName.isEmpty()) {
				String uploadPath = "C:\\Users\\User\\Documents\\workspace-sts-3.9.12.RELEASE\\Expo_wave555\\src\\main\\webapp\\resources\\upload";
				File target = new File(uploadPath + "/" + savedName);
				file.transferTo(target);
				dto.setImg(savedName);
			} else {
				dto.setImg(existingBoard.getImg());
			}

			if (dto.getBoard_title().isEmpty()) {
				dto.setBoard_title(existingBoard.getBoard_title());
			}
			if (dto.getBoard_content().isEmpty()) {
				dto.setBoard_content(existingBoard.getBoard_content());
			}
		}

		dao.update(dto);
		redirectAttributes.addFlashAttribute("message", "수정이 완료되었습니다."); 
		
		return "redirect:notice"; 
	}

	@RequestMapping("notice/delete")
	public String delete(@RequestParam("board_id") int board_id) {
	    BoardVO boardVO = new BoardVO();
	    boardVO.setBoard_id(board_id); // faq_id를 설정하는 메서드명은 실제 VO 클래스에 맞게 변경해야 함

	    int result = dao.delete(boardVO);

	    return "redirect:notice"; 
	}
	
	@RequestMapping("notice/one")
	public String one(int id, String title, Model model) {
	    BoardVO dto = dao.one(id, title);
	    model.addAttribute("dto", dto);
	    return "notice/one"; // 조회 결과를 보여줄 뷰 이름
	}
	
	@RequestMapping("notice/one2")
	public String one2(@RequestParam("id") int id, Model model) {
		BoardVO dto = dao.oneById(id); // ID만 사용하여 데이터 조회
		model.addAttribute("dto", dto);
		return "notice/faq_one"; // 조회 결과를 보여줄 뷰 이름
	}
	
	
	@RequestMapping("notice/notice") 
	public String list(Model model) {
	  List<BoardVO> list = dao.list();
	  model.addAttribute("list", list);
	  return "notice/notice";
	}

}
