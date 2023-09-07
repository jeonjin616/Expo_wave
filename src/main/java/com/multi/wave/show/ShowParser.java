package com.multi.wave.show;




import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;


@Component
public class ShowParser {
	
	/*
	 * @Value("${show.serviceKey}") // Import this annotation private String
	 * serviceKey; // Define a field to hold the serviceKey value
	 */

	    public ArrayList<ShowVO> parse(int page) throws Exception {
	        String baseApiUrl = "http://kopis.or.kr/openApi/restful/pblprfr";
	        String service = "";
	        String stdate = "20230101";
	        String eddate = "20301231";
	        int cpage = page;
	        String rows = "500";

	        String param = "?service=" + service + "&stdate=" + stdate + "&eddate=" + eddate + "&cpage=" + cpage + "&rows="
	                + rows;
	        String urlBuilder = baseApiUrl + param;

	        System.out.println(urlBuilder);

	        RestTemplate restTemplate = new RestTemplate();
	        String xml = restTemplate.getForObject(urlBuilder, String.class);

	        JSONObject json = XML.toJSONObject(xml);

	        JSONObject dbs = json.getJSONObject("dbs");
	        JSONArray dbArray = dbs.getJSONArray("db");

	        ArrayList<ShowVO> list = new ArrayList<>();
	        for (int i = 0; i < dbArray.length(); i++) {
	            JSONObject db = dbArray.getJSONObject(i);

	            String mt20id = db.getString("mt20id");
	            String detailUrl = "http://kopis.or.kr/openApi/restful/pblprfr/" + mt20id;
	            String detailParam = "?service=" + service;

	            detailUrl += detailParam;

	            RestTemplate restTemplate1 = new RestTemplate();
	            String xml1 = restTemplate1.getForObject(detailUrl, String.class);

	            JSONObject json1 = XML.toJSONObject(xml1);
	            JSONObject dbs1 = json1.getJSONObject("dbs");
	            JSONObject db1 = dbs1.getJSONObject("db");

	            ShowVO vo = new ShowVO();

	            vo.setShow_id(db1.getString("mt20id"));
	            vo.setShow_name(db1.getString("prfnm"));
	            vo.setShow_start(db1.getString("prfpdfrom"));
	            vo.setShow_end(db1.getString("prfpdto"));
	            vo.setShow_place(db1.getString("fcltynm"));
	            vo.setShow_actor(db1.getString("prfcast"));
	            vo.setShow_crew(db1.getString("prfcrew"));
	            vo.setShow_runtime(db1.getString("prfruntime"));
	            vo.setShow_age(db1.getString("prfage"));
	            vo.setShow_company(db1.getString("entrpsnm"));
	            vo.setShow_charge(db1.getString("pcseguidance"));
	            vo.setShow_poster(db1.getString("poster"));
	            vo.setShow_story(db1.getString("sty"));
	            vo.setShow_genre(db1.getString("genrenm"));
	            vo.setShow_when(db1.getString("dtguidance"));
	            list.add(vo);
	        }
	        return list;
	    }
	}
