package com.multi.wave.md;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MDPostDAO {

	@Autowired
	SqlSessionTemplate mdPostSST;

	
	public List<MDPostVO> MDAll(PagingVO vo) {
		return mdPostSST.selectList("MD.postsAll",vo);
	}
	
	
	public List<MDPostVO> getMDPostByTitle(String md_title) {
		return mdPostSST.selectList("MD.getPostsByTitle", md_title);
	}
	
	public MDPostVO getMDPostById(int id) {
		return mdPostSST.selectOne("MD.getPostsById", id);
	}

	
	public int MDPostinsert(MDPostVO mdPostDTO) {
		return mdPostSST.insert("MD.postsMake", mdPostDTO);
	}

	
	public int MDPostUpdate(MDPostVO mdPostDTO) {
		return mdPostSST.update("MD.postUpdate", mdPostDTO);
	}
	
	
	public int MDPostDelete(MDPostVO mdPostDTO) {
		return mdPostSST.delete("MD.postDelete", mdPostDTO);
	}

	public int MDPostCount() {
		return mdPostSST.selectOne("MD.postCount");
	}
	public int Count() {
		return mdPostSST.selectOne("MD.count");
	}
	

}
