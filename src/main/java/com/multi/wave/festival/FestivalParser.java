package com.multi.wave.festival;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;



@Component
public class FestivalParser {

	public ArrayList<FestivalVO> parse(int page) throws Exception {
	
		
		    
			String numOfRows = "500";
			String pageNo = "1";
			String mobileOS = "ETC";
			String mobileApp = "APPTest";
			String type = "json";
			String listYN = "Y";
			String arrange = "A";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String eventStartDate = sdf.format(new Date());

			String str = "http://apis.data.go.kr/B551011/KorService1/searchFestival1?"
					+ "serviceKey="
					+ "&numOfRows=" + numOfRows + "&pageNo=" + pageNo + "&MobileOS=" + mobileOS + "&MobileApp=" + mobileApp
					+ "&_type=" + type + "&listYN=" + listYN + "&arrange=" + arrange + "&eventStartDate=" + eventStartDate;

	

			URL uri = new URL(str);
			System.out.println(uri.toString());
			HttpURLConnection con = (HttpURLConnection) uri.openConnection();
			con.setRequestMethod("GET");
			int resCode = con.getResponseCode();
			BufferedReader br = null;
			if (resCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			} else {// error:
				System.out.println("error: " + resCode);
				br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
			}

			String line = "";
			StringBuilder buf = new StringBuilder();
			while ((line = br.readLine()) != null) {
				buf.append(line);
			}
			br.close();
			String str2 = buf.toString();
			//System.out.println(str2);

			RestTemplate restTemplate = new RestTemplate();
			String jsonResponse = restTemplate.getForObject(uri.toString(), String.class);
			//System.out.println(jsonResponse);
			JSONObject response = new JSONObject(str2);
			JSONObject body = response.getJSONObject("response").getJSONObject("body");
			JSONObject items = body.getJSONObject("items");
			JSONArray itemArray = items.optJSONArray("item");

			ArrayList<FestivalVO> list = new ArrayList<>();
			for (int i = 0; i < itemArray.length(); i++) {
				JSONObject db = itemArray.getJSONObject(i);

				FestivalVO vo = new FestivalVO();
				vo.setFsv_name(db.getString("title"));
				vo.setFsv_tel(db.getString("tel"));
				vo.setFsv_start(db.getString("eventstartdate"));
				vo.setFsv_end(db.getString("eventenddate"));
				vo.setFsv_orgimg(db.getString("firstimage"));
				vo.setFsv_thumb(db.getString("firstimage2"));
				vo.setFsv_add(db.getString("addr1"));
				vo.setFsv_lat(db.getString("mapy").isEmpty() ? null : new BigDecimal(db.getString("mapy")));
				vo.setFsv_lon(db.getString("mapx").isEmpty() ? null : new BigDecimal(db.getString("mapx")));

				list.add(vo);
				System.out.println(list.size());
				//System.out.println(list);
			}
			return list;
		}
	}
