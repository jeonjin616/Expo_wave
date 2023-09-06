package com.multi.wave.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public int insert(FaqVO dto) {
		int result = my.insert("faq.insert",dto);
		System.out.println("Image Filename in DTO: " + dto.getImg());
		
		return result;
	}
	
	public int update(FaqVO dto) {
		int result = my.update("faq.update",dto);
		return result;
	}
	
	public int delete(FaqVO dto) {
		int result = my.delete("faq.delete",dto);
		return result;
	}
	
	public FaqVO one(int faq_id, String faq_title) {
	    Map<String, Object> parameters = new HashMap<>();
	    parameters.put("faq_id", faq_id);
	    parameters.put("faq_title", faq_title);
	    
	    return my.selectOne("faq.one", parameters);
	}
	
	public FaqVO oneById(int faq_id) {
	    return my.selectOne("faq.oneById", faq_id);
	}
	
	public List<FaqVO> list() {
		  if (my == null) {
		    System.out.println("my is null");
		  }
		  return my.selectList("faq.all");
		}

	public List<FaqVO> searchFaq(String keyword) {
	    return my.selectList("faq.searchFaq", keyword);
	  }
	
	public List<FaqVO> getPagedFaq(PagingVO2 vo) {
		return my.selectList("faq.getPagedFaq",vo);
	}
	
	public int pageCount() {
		return my.selectOne("faq.count");
	}
	
}
