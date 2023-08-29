package com.multi.wave.show;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ShowDAO {

	@Autowired
	SqlSessionTemplate my;

	public void insert(ShowVO vo) {

		my.insert("show.insert", vo);
	}

	public void deleteAll() {
		my.delete("show.deleteAll");
	}

	public List<ShowVO> list() {
		return my.selectList("show.list");
	}

	public List<ShowVO> all(Page1VO vo) {
		return my.selectList("show.all", vo);
	}

	public List<ShowVO> list2(Page1VO vo) {
		return my.selectList("show.list2", vo);
	}

	public int count() {
		return my.selectOne("show.count");
	}

	public List<ShowVO> search(String query) {
	    return my.selectList("show.search", "%" + query + "%");
	}
	public List<ShowVO> searchlist(Page1VO vo) {
		return my.selectList("show.searchlist", vo);
	}
}
