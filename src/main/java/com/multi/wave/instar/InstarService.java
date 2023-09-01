package com.multi.wave.instar;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
@PropertySource("classpath:key.properties")
@EnableScheduling
public class InstarService {

	@Autowired
	InstarDAO instardao;

	@Autowired
	ApplicationContext ctx;
	
	
	@Scheduled(cron = "0 0 4 * * *") // Run at 4:00 AM every day
	public void instarUpate() {
		try {
			instardao.instarDelete();
			instarInsert();
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("IOException 에러");

		} catch (ParseException e) {
			e.printStackTrace();
			System.out.println("ParseException 에러");

		}
	}

	private void instarInsert() throws IOException, ParseException{
		
		Environment env = ctx.getEnvironment();
		String key = env.getProperty("instar.accessToken");
//		https://graph.instagram.com/6503268109710415/media?fields=id,media_type,media_url,permalink,thumbnail_url,username,caption&access_token=IGQWROYnBxODdxb1l4a0JWbTl0UGdkZAGtBRXcweURpYVBLZA3FWZAm43U1JIVl9fd0JFLUs0QzRxUXBUQl8yWEhZASmZAFTjN4TjE3VERabl9Hcmw0dEhKNWdLSVdNTTl6OUY2aW1FVVZAmUVlBUQZDZD
		StringBuilder urlBuilder = new StringBuilder("https://graph.instagram.com/6503268109710415/media");
		urlBuilder.append("?" + URLEncoder.encode("fields", "UTF-8") + "="
				+ URLEncoder.encode("id,media_type,media_url,permalink,thumbnail_url,username,caption", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("access_token", "UTF-8")+"=");
		urlBuilder.append(key);
		System.out.println(urlBuilder);
		
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/xml");

		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd; // 저장공간

		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		// 저장공간에 있는 꺼내서 옮겨주어야 한다.
		System.out.println(sb.toString()); // XML태그가 들어있는 String!!

		JSONParser parser = new JSONParser();
		JSONObject jsonObject = (JSONObject) parser.parse(sb.toString());
		
		
		
		
		JSONArray arr = (JSONArray) jsonObject.get("data"); // {"item":[{"countryEnName":"Japan","fileUrl":"http://www.0404.go.kr/dev/fileDo
//		System.out.println(arr.size());

		        	for(Object arr2 : arr) {
		        	JSONObject obj = (JSONObject) arr2;
		        	InstarVO vo = new InstarVO();
		        	

//		        	vo.setId(obj.get("id").toString());
//		        	vo.setMedia_type(obj.get("media_type").toString());
//		        	vo.setMedia_url(obj.get("media_url").toString());
//		        	vo.setPermalink(obj.get("permalink").toString());
//		        	vo.setUsername(obj.get("username").toString());
		        	

		        	
		        	vo.setId((String) obj.get("id"));
		        	vo.setMedia_type((String) obj.get("media_type"));
		        	vo.setMedia_url((String) obj.get("media_url"));
		        	vo.setPermalink((String) obj.get("permalink"));
		        	vo.setUsername((String) obj.get("username"));
		        	vo.setCaption((String) obj.get("caption"));

//					System.out.println(obj.get("id"));
//					System.out.println(obj.get("media_type"));
//					System.out.println(obj.get("media_url"));
//					System.out.println(obj.get("permalink"));
//					System.out.println(obj.get("username"));
//					System.out.println();
		        	
		        	instardao.instarinsert(vo);
		        	}

		rd.close();
		conn.disconnect();
	}

}
