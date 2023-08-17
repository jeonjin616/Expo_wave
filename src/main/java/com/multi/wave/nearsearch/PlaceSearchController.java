package com.multi.wave.nearsearch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;
import java.util.Map;

@Controller
public class PlaceSearchController {

    @Autowired
    private PlaceSearchService placeSearchService;

    @GetMapping("showdetail/caferestaurant")
    public String searchPlaces(
        @RequestParam(required = false) String address, // 주소 파라미터 (필수 아님)
        @RequestParam(required = false) String type, // 타입 파라미터 (필수 아님, 예: 음식점, 카페)
        Model model) {
        
        if (address != null && type != null) {
            List<Map<String, String>> places;
        
            if ("음식점".equals(type)) {
                places = placeSearchService.searchRestaurants(address);
            } else { 
                places = placeSearchService.searchCafes(address);
            }
        
            model.addAttribute("places", places);
        }
        
        return "detail/caferestaurant";
    }
    
    @GetMapping("festivaldetail/caferestaurant")
    public String searchPlaces2(
        @RequestParam(required = false) String address, 
        @RequestParam(required = false) String type,
        Model model) {
        
        if (address != null && type != null) {
            List<Map<String, String>> places;
        
            if ("음식점".equals(type)) {
                places = placeSearchService.searchRestaurants(address);
            } else {  
                places = placeSearchService.searchCafes(address);
            }
        
            model.addAttribute("places", places);
        }
        
        return "detail/caferestaurant";
    }
}
