package com.multi.wave.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.wave.md.MDPostVO;
import com.multi.wave.md.PagingVO;

@Repository
public class BoardDAO {

	@Autowired
	SqlSessionTemplate my;

	public int insert(BoardVO dto) {
		int result = my.insert("board.insert", dto);
		System.out.println("Image Filename in DTO: " + dto.getImg());

		return result;
	}

	public int update(BoardVO dto) {
		int result = my.update("board.update", dto);
		return result;
	}

	public int delete(BoardVO dto) {
		int result = my.delete("board.delete", dto);
		return result;
	}

	public BoardVO one(int board_id, String board_title) {
	    Map<String, Object> parameters = new HashMap<>();
	    parameters.put("board_id", board_id);
	    parameters.put("board_title", board_title);
	    
	    return my.selectOne("board.one", parameters);
	}
	
	public BoardVO oneById(int board_id) {
	    return my.selectOne("board.oneById", board_id);
	}

	/*
	 * public List<BoardVO> list() { return my.selectList("board.all"); }
	 */
	
	public List<BoardVO> searchBoard(String keyword) {
	    return my.selectList("board.searchBoard", keyword);
	  }
	
	public List<BoardVO> getPagedBoards(PagingVO2 vo) {
		return my.selectList("board.getPagedBoards",vo);
	}
	
	public int pageCount() {
		return my.selectOne("board.count");
	}
	
}
