package com.multi.wave.md;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class MDCommentDAO {

	@Autowired
	SqlSessionTemplate mdCommentSST;

	//전체 가져오기
	public List<MDCommentDTO> getMDCommentById(int id) {
		List<MDCommentDTO> commentList = mdCommentSST.selectList("MD.GetCommentById", id);
		return commentList;
	}

	//댓글 작성하기
	public int MDCommentinsert(MDCommentDTO mdCommentDTO) {
		return mdCommentSST.insert("MD.CommentMake",mdCommentDTO);
	}
	
	//댓글 삭제하기
	public int MDCommentdelete(MDCommentDTO mdCommentdto) {
		return mdCommentSST.delete("MD.CommentDelete", mdCommentdto);
	}
	
	//댓글 수정하기
	public int MDCommentupdate(MDCommentDTO mdcommentdto) {
		return mdCommentSST.update("MD.CommentUpdate",mdcommentdto);
	}
}
