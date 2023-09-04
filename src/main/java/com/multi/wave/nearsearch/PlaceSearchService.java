package com.multi.wave.nearsearch;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class PlaceSearchService {

    // 구글 플레이스 API 키
    private static final String apiKey = "";

    // 카페 검색을 위한 메서드
    public List<Map<String, String>> searchCafes(String address) {
        return searchPlacesByType(address, "카페");
    }

    // 음식점 검색을 위한 메서드
    public List<Map<String, String>> searchRestaurants(String address) {
        return searchPlacesByType(address, "음식점");
    }

    // 주소와 타입에 따른 장소 검색 메서드 (카페 또는 음식점 등)
    private List<Map<String, String>> searchPlacesByType(String address, String type) {
        String query="";
        try {
            // 주소와 타입을 UTF-8로 인코딩
            query = URLEncoder.encode(address + " " + type, "UTF-8");
        } catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
        }

        // Places API Text Search 요청 URL 생성
        String urlString = String.format("https://maps.googleapis.com/maps/api/place/textsearch/json?query=%s&key=%s", query, apiKey);

        // 결과를 저장할 리스트
        List<Map<String, String>> places = new ArrayList<Map<String, String>>();

        try {
            URL url = new URL(urlString);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            // 서버 응답 읽기
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }

            // JSON 응답 파싱
            JSONObject responseJson = new JSONObject(sb.toString());
            JSONArray results = responseJson.getJSONArray("results");

            // 결과에서 필요한 정보 추출
            for (int i = 0; i < results.length(); i++) {
                JSONObject place = results.getJSONObject(i);
                Map<String, String> placeInfo = new HashMap<String, String>();
                placeInfo.put("name", place.getString("name"));
                placeInfo.put("address", place.getString("formatted_address"));
                places.add(placeInfo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return places; // 검색된 장소 목록 반환
    }
}
