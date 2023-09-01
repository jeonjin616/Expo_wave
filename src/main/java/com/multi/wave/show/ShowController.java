package com.multi.wave.show;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/list")
public class ShowController {

	@Autowired
	ShowService showService;

	@Autowired
	ShowDAO showDAO;
	
	/*
	 * @Value("${show.serviceKey}") // Import this annotation private String key; //
	 * Define a field to hold the serviceKey value
	 * 
	 */
	@RequestMapping("/show")
	public void insert(ShowParser parser) throws Exception {

		showDAO.deleteAll();

		
			ArrayList<ShowVO> list = parser.parse(1);
			for (ShowVO showVO : list) {
				showService.insert(showVO);
			
		}
	}

	@RequestMapping("/showlist")
	public String list(Model model) {
		List<ShowVO> list = showService.list();
		model.addAttribute("show", list);
		return "list/showlist";
	}

	@RequestMapping("showdetail/{show_id}")
	public String showDetail(@PathVariable("show_id") int showId, Model model) {
		// Logic to fetch show details by showId from your service or DAO
		// Add the show details to the model
		return "showdetail"; // Return the name of the JSP view
	}

	@RequestMapping("/showlist2")
	public void list2(Page1VO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<ShowVO> list2 = showDAO.list2(vo);
		// System.out.println(list2.size());
		model.addAttribute("list2", list2);
	}

	@RequestMapping("/showAll")
	public String all2(Page1VO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<ShowVO> list2 = showDAO.all(vo);
		int count = showDAO.count();
		//System.out.println("all count>> " + count);
		int pages = count / 16 + (count % 16 > 0 ? 1 : 0);
		//int pages = (int) Math.ceil((double) count / 16);
		model.addAttribute("list2", list2);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
		// 페이지 링크를 표시하기 위한 부분 추가
		/*
		 * int currentPage = vo.getPage(); int startPage = Math.max(currentPage - 10,
		 * 1); int endPage = Math.min(currentPage + 10, pages);
		 * 
		 * model.addAttribute("startPage", startPage); model.addAttribute("endPage",
		 * endPage); model.addAttribute("currentPage", currentPage);
		 */
		return "list/showAll";
	}
	
	/*
	 * @RequestMapping("/loadPage") public String loadPage(Page1VO vo, Model model)
	 * { vo.setStartEnd(vo.getPage()); List<ShowVO> list2 = showDAO.all(vo);
	 * model.addAttribute("list2", list2); return "list/showAll :: row2"; // Return
	 * only the row2 fragment of the view }
	 */

    @RequestMapping("/showSearch")
    public String showSearch(
        @RequestParam("query") String query,
        Page1VO vo,
        Model model
    ) {
        vo.setStartEnd(vo.getPage());

        List<ShowVO> showSearch = showService.search(query);
        int count = showSearch.size();
        int itemsPerPage = 16; // 페이지당 보여줄 아이템 수
        int totalPages = (int) Math.ceil((double) count / itemsPerPage);

        model.addAttribute("query", query);
        model.addAttribute("count", count);
        model.addAttribute("pages", totalPages);

        // 현재 페이지에 해당하는 검색 결과를 가져오기 위해 부분 리스트를 가져옴
        int startIndex = (vo.getPage() - 1) * itemsPerPage;
        int endIndex = Math.min(startIndex + itemsPerPage, count);
        List<ShowVO> showSearchPerPage = showSearch.subList(startIndex, endIndex);
        model.addAttribute("showSearch", showSearchPerPage);

        return "list/showSearch";
    }
    
    @RequestMapping("/showSearch2")
    public void showSearch2(Page1VO vo, Model model) {
        vo.setStartEnd(vo.getPage()); // 시작과 종료 인덱스 계산

        List<ShowVO> searchlist = showService.searchlist(vo);
        model.addAttribute("showSearch2", searchlist);

        // 검색 결과를 보여줄 뷰 템플릿의 이름 리턴
        //return "list/searchResults2"; 
    }
	
	/*
	 * @RequestMapping("/showlist2") public void list2(Page1VO vo, Model model) {
	 * vo.setStartEnd(vo.getPage()); List<ShowVO> list2 = showDAO.list2(vo); //
	 * System.out.println(list2.size()); model.addAttribute("list2", list2); }
	 */


}
