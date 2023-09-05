package com.multi.wave.instar;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

@Repository
public class InstarDAO {
	
	@Autowired
	SqlSessionTemplate instarSST;
	
	public List<InstarVO> instarUpdate(InstarVO instarVO) {
		return instarSST.selectList("Instar.InstarAll", instarVO);
	}

	public void instarinsert(InstarVO vo) {
		instarSST.insert("Instar.InstarUpdate",vo);
	}
	
	public void instarDelete() {
		instarSST.delete("Instar.deleteAll");
	}

	public int instarcount() {
		return instarSST.selectOne("Instar.InstarCount");
	}
	
	
	public int count() {
		return instarSST.selectOne("Instar.count");
	}
	
	public List<InstarVO> instarUpdate2(PagingVO vo) {
		return instarSST.selectList("Instar.InstarAll2", vo);
	}
}
