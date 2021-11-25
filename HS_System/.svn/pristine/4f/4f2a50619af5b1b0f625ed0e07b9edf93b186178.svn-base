package kr.ac.hs.controller.common;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.service.common.SearchService;

@Controller
@RequestMapping("/search")
public class SearchController {

	@Autowired
	private SearchService service;

	@RequestMapping(value = "/department", method = RequestMethod.GET)
	public String searchDepartment(SearchCriteria cri, Model model) throws Exception {
		String url = "search/department";
		Map<String, Object> dataMap = service.getDepartmentList(cri);

		model.addAllAttributes(dataMap);

		return url;
	}

	@RequestMapping(value = "/faculty", method = RequestMethod.GET)
	public String searchFaculty(SearchCriteria cri, Model model) throws Exception {
		String url = "search/faculty";
		Map<String, Object> dataMap = service.getFacultyList(cri);
		model.addAllAttributes(dataMap);

		return url;
	}

}
