package kr.ac.hs.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.DepartmentVO;

public interface DepartmentService {

	// 학과 검색
	public DepartmentVO getDepartmentByName(String dept_nm) throws SQLException;

	// 학과 목록
	public List<DepartmentVO> getDepartmentList(SearchCriteria cri) throws SQLException;

	// 학과 등록
	public void insertDepartment(DepartmentVO department) throws SQLException;

	// 학과 수정
	public void updateDepartment(DepartmentVO department) throws SQLException;

	// 학과목록(학과관리)
	public Map<String, Object> getDepartmentSearch(SearchCriteria cri) throws SQLException;

	// 학과상세(학과관리)
	public List<DepartmentVO> getDepartmentDetail(String dept_nm) throws SQLException;
}
