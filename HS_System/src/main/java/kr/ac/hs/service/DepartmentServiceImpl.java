package kr.ac.hs.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.PageMaker;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dao.DepartmentDAO;
import kr.ac.hs.dto.DepartmentVO;

public class DepartmentServiceImpl implements DepartmentService {
	private DepartmentDAO departmentDAO;

	public void setDepartmentDAO(DepartmentDAO departmentDAO) {
		this.departmentDAO = departmentDAO;
	}

	@Override
	public DepartmentVO getDepartmentByName(String dept_nm) throws SQLException {
		DepartmentVO deptVO = departmentDAO.selectDepartmentByDepartmentName(dept_nm);
		return deptVO;
	}

	@Override
	public List<DepartmentVO> getDepartmentList(SearchCriteria cri) throws SQLException {
		List<DepartmentVO> deptList = departmentDAO.selectDepartment(cri);
		return deptList;
	}

	@Override
	public void insertDepartment(DepartmentVO department) throws SQLException {
		departmentDAO.insertDepartment(department);

	}

	@Override
	public void updateDepartment(DepartmentVO department) throws SQLException {
		departmentDAO.updateDepartment(department);

	}

	@Override
	public Map<String, Object> getDepartmentSearch(SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<DepartmentVO> departList = departmentDAO.selectDepartmentSearch(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(departList.get(0).getTotalcnt());

		dataMap.put("departList", departList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public List<DepartmentVO> getDepartmentDetail(String dept_nm) throws SQLException {
		List<DepartmentVO> departDetail = departmentDAO.selectDepartmentDetail(dept_nm);
		return departDetail;
	}

}
