package kr.ac.hs.service.common;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.PageMaker;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dao.DepartmentDAO;
import kr.ac.hs.dto.DepartmentVO;

public class SearchServiceImpl implements SearchService {

	private DepartmentDAO departmentDAO;

	public void setDepartmentDAO(DepartmentDAO departmentDAO) {
		this.departmentDAO = departmentDAO;
	}

	// 학과 찾기
	@Override
	public Map<String, Object> getDepartmentList(SearchCriteria cri) throws SQLException {
		HashMap<String, Object> dataMap = new HashMap<String, Object>();

		List<DepartmentVO> deptList = departmentDAO.selectDepartment(cri);

		int count = departmentDAO.selectCountDepartment();

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);

		dataMap.put("deptList", deptList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	// 학부 찾기
	@Override
	public Map<String, Object> getFacultyList(SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<DepartmentVO> facultyList = departmentDAO.selectFacultySearch(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(facultyList.get(0).getTotalcnt());

		dataMap.put("facultyList", facultyList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}
}
