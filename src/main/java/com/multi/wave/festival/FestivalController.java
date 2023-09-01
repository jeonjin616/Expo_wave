package com.multi.wave.festival;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.wave.show.Page1VO;
import com.multi.wave.show.ShowVO;

@Controller
@RequestMapping("/list")
public class FestivalController {

	@Autowired
	FestivalService festivalService;

	@Autowired
	FestivalDAO festivalDAO;
	

	@RequestMapping("/festival")
	public void insert(FestivalParser parser) throws Exception {
	
		
		festivalDAO.deleteAll();

		

			ArrayList<FestivalVO> list = parser.parse(1);
			for (FestivalVO festivalVO : list) {
				festivalService.insert(festivalVO);
			}
		}

	

	@RequestMapping("/festivallist")
	public String list(Model model) {
		List<FestivalVO> list = festivalService.list();
		model.addAttribute("festival", list);
		return "list/festivallist";
	}

	@RequestMapping("festivaldetail/{{fsv_id}")
	public String festivalDetail(@PathVariable("fsv_id") int showId, Model model) {
		return "festivaldetail"; // Return the name of the JSP view
	}

	@RequestMapping("/festivallist2")
	public void list2(PageVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<FestivalVO> list2 = festivalDAO.list2(vo);
		//System.out.println(list2.size());
		model.addAttribute("list2", list2);
	}

	@RequestMapping("/festivalAll")
	public String all2(PageVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<FestivalVO> list2 = festivalDAO.all(vo);
		int count = festivalDAO.count();
		System.out.println("all count>> " + count);
		int pages = count / 16 + (count % 16 > 0 ? 1 : 0);
		model.addAttribute("list2", list2);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
		return "list/festivalAll";
	}


    @RequestMapping("/festivalSearch")
    public String festivalSearch(
        @RequestParam("query") String query,
        PageVO vo,
        Model model
    ) {
        vo.setStartEnd(vo.getPage());

        List<FestivalVO> festivalSearch = festivalService.search(query);
        int count = festivalSearch.size();
        int itemsPerPage = 16; // 페이지당 보여줄 아이템 수
        int totalPages = (int) Math.ceil((double) count / itemsPerPage);

        model.addAttribute("query", query);
        model.addAttribute("count", count);
        model.addAttribute("pages", totalPages);

        // 현재 페이지에 해당하는 검색 결과를 가져오기 위해 부분 리스트를 가져옴
        int startIndex = (vo.getPage() - 1) * itemsPerPage;
        int endIndex = Math.min(startIndex + itemsPerPage, count);
        List<FestivalVO> festivalSearchPerPage = festivalSearch.subList(startIndex, endIndex);
        model.addAttribute("festivalSearch", festivalSearchPerPage);

        return "list/festivalSearch";
    }
    
    @RequestMapping("/festivalSearch2")
    public void festivalSearch2(PageVO vo, Model model) {
        vo.setStartEnd(vo.getPage()); // 시작과 종료 인덱스 계산

        List<FestivalVO> searchlist = festivalService.searchlist(vo);
        model.addAttribute("festivalSearch2", searchlist);

       
    }
	


}