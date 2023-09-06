package com.multi.wave.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InquiryDAO {

	@Autowired
	SqlSessionTemplate my;

	public int insert(InquiryVO dto) {
		int result = my.insert("inquiry.insert", dto);
		System.out.println("Image Filename in DTO: " + dto.getImg());

		return result;
	}

	public int update(InquiryVO dto) {
		int result = my.update("inquiry.update", dto);
		return result;
	}

	public int delete(InquiryVO dto) {
		int result = my.delete("inquiry.delete", dto);
		return result;
	}

	public InquiryVO one(int inqu_id, String inqu_title) {
	    Map<String, Object> parameters = new HashMap<>();
	    parameters.put("inqu_id", inqu_id);
	    parameters.put("inqu_title", inqu_title);
	    
	    return my.selectOne("inquiry.one", parameters);
	}
	
	public InquiryVO oneById(int inqu_id) {
	    return my.selectOne("inquiry.oneById", inqu_id);
	}

	public List<InquiryVO> listByWriter(String writer) {
	    return my.selectList("inquiry.listByWriter", writer);
	}
	
	public List<InquiryVO> searchInqu(String keyword) {
	    return my.selectList("inquiry.searchInqu", keyword);
	  }
	
	public List<InquiryVO> listAll() {
	    return my.selectList("inquiry.listAll");
	}
	
	public List<InquiryVO> getPagedInqu(PagingVO2 vo) {
		return my.selectList("inquiry.getPagedInqu",vo);
	}
	
	public int pageCount() {
		return my.selectOne("inquiry.count");
	}
}
