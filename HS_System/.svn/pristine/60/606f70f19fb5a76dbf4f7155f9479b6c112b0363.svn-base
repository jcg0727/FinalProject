package kr.ac.hs.dao;

import java.sql.SQLException;
import java.util.List;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.DepartmentVO;

public interface DepartmentDAO {
	public DepartmentVO selectDepartmentByDepartmentName(String dept_nm) throws SQLException;

	public List<DepartmentVO> selectDepartment(SearchCriteria cri) throws SQLException;

	public int selectCountDepartment() throws SQLException;

	// 학과 등록
	public void insertDepartment(DepartmentVO department) throws SQLException;

	// 학과 수정
	public void updateDepartment(DepartmentVO department) throws SQLException;

	DepartmentVO selectDepartmentByDeptartmentCode(String dept_cd) throws SQLException;

	// 페이징, 검색 포함 학과목록
	public List<DepartmentVO> selectDepartmentSearch(SearchCriteria cri) throws SQLException;

	// 학과상세(학과관리)
	public List<DepartmentVO> selectDepartmentDetail(String dept_nm) throws SQLException;

	List<DepartmentVO> selectFacultySearch(SearchCriteria cri) throws SQLException;

}
