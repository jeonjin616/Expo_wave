package com.multi.wave.notice;

import java.io.File;
import java.util.List;

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
	                      Model model)throws Exception {
        
            String savedName = file.getOriginalFilename();

            String uploadPath = "C:\\Users\\User\\Documents\\workspace-sts-3.9.12.RELEASE\\Expo_wave333\\src\\main\\webapp\\resources\\img";
            File target = new File(uploadPath + "/" + savedName);
            
            file.transferTo(target);

            model.addAttribute("savedName", savedName);

            // �� �κп��� BoardVO ��ü�� �����ϰ� �ʵ带 ä���־�� �մϴ�.
            BoardVO dto = new BoardVO();
            dto.setBoard_title(title);
            dto.setBoard_content(content);
            dto.setImg(savedName);
            
            dao.insert(dto);

            return "redirect:notice";

    }
	
	@GetMapping("notice/edit")
	public String edit(@RequestParam("board_id") int board_id, Model model) {
		BoardVO dto = dao.oneById(board_id); // ���ο� �޼��� ȣ��
		model.addAttribute("dto", dto);
		return "notice/update"; // ���� �������� �̵�
	}

	// ���� �۾��� ó���ϴ� �޼���
	@PostMapping("notice/update_action")
	public String update(@RequestParam("file") MultipartFile file, @RequestParam("board_id") int boardId, 
			@RequestParam("board_title") String title, @RequestParam("board_content") String content,
			RedirectAttributes redirectAttributes) throws Exception {

		BoardVO dto = new BoardVO();
		dto.setBoard_id(boardId); // id�� ����
		dto.setBoard_title(title); // title ����
		dto.setBoard_content(content); // question ����

		BoardVO existingBoard = dao.oneById(boardId); // �Ķ���ͷ� ���� id�� ���

		if (existingBoard != null) {
			String savedName = (file != null && !file.isEmpty()) ? file.getOriginalFilename() : "";
			if (!savedName.isEmpty()) {
				String uploadPath = "C:\\Users\\User\\Documents\\workspace-sts-3.9.12.RELEASE\\Expo_wave333\\src\\main\\webapp\\resources\\img";
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
		redirectAttributes.addFlashAttribute("message", "������ �Ϸ�Ǿ����ϴ�."); 
		
		return "redirect:notice"; 
	}

	@RequestMapping("notice/delete")
	public String delete(@RequestParam("board_id") int board_id) {
	    BoardVO boardVO = new BoardVO();
	    boardVO.setBoard_id(board_id); // faq_id�� �����ϴ� �޼������ ���� VO Ŭ������ �°� �����ؾ� ��

	    int result = dao.delete(boardVO);

	    return "redirect:notice"; // �����̷�Ʈ ��θ� ������Ʈ�� �°� ����
	}
	
	@RequestMapping("notice/one")
	public String one(int id, String title, Model model) {
	    BoardVO dto = dao.one(id, title);
	    model.addAttribute("dto", dto);
	    return "notice/one"; // ��ȸ ����� ������ �� �̸�
	}
	
	@RequestMapping("notice/one2")
	public String one2(@RequestParam("id") int id, Model model) {
		BoardVO dto = dao.oneById(id); // ID�� ����Ͽ� ������ ��ȸ
		model.addAttribute("dto", dto);
		return "notice/faq_one"; // ��ȸ ����� ������ �� �̸�
	}
	
	@RequestMapping("notice/notice")
	public String list(Model model) {
		List<BoardVO> list = dao.list();
		model.addAttribute("list", list);
		return "notice/notice";
	}
	
	
	
	
	
}
