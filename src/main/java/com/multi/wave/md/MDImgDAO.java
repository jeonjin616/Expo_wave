package com.multi.wave.md;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;



@Repository
public class MDImgDAO {

	// 몇번째 id인지 일괄적으로 확인하기 위해 해당 템플릿을 활용
	@Autowired
	SqlSessionTemplate mdImgSST;

//	public List<MDImgDTO> getMDImgById(int id) {
//		List<MDImgDTO> imgList = mdImgSST.selectList("MD.GetImgById", id);
//		return imgList;
//	}
//이게 과연 맞는건지?..
	@RequestMapping("MDPostMake")
	public int MDPostinsert(MDImgVO mdimgDTO) {
		return mdImgSST.insert("MD.imgMake", mdimgDTO);
	}
	
}