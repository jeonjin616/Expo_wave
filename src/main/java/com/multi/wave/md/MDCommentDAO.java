package com.multi.wave.md;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class MDCommentDAO {

	@Autowired
	SqlSessionTemplate mdCommentSST;

	//댓글 전체 가져오기
	public List<MDCommentVO> getMDCommentById(int id) {
		List<MDCommentVO> commentList = mdCommentSST.selectList("MD.getCommentById", id);
		return commentList;
	}

	//댓글 작성하기
	public int MDCommentinsert(MDCommentVO mdCommentvo) {
		return mdCommentSST.insert("MD.commentMake",mdCommentvo);
	}
	
	//댓글 삭제하기
	public int MDCommentdelete(MDCommentVO mdCommentvo) {
		return mdCommentSST.delete("MD.commentDelete", mdCommentvo);
	}
	
	//댓글 수정하기
	public int MDCommentupdate(MDCommentVO mdCommentvo) {
		return mdCommentSST.update("MD.commentUpdate",mdCommentvo);
	}
}
