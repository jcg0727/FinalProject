package kr.ac.hs.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.Criteria;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.AcademicFreshmenVO;

public interface AcademicFreshmenService {
	
	public String selectDept_nmByStaff_no(String staff_no)throws SQLException;
	
	public List<AcademicFreshmenVO> getInfoByStaff_no(String staff_no)throws SQLException;
	public List<AcademicFreshmenVO> getInfoByStaff_no(String staff_no, Criteria cri)throws SQLException;
	Map<String, Object> getInfoByStaff_no(String staff_no, SearchCriteria cri)throws SQLException;
	
	public List<AcademicFreshmenVO> selectDetailByStudent_no(String student_no)throws SQLException;
	
	public List<AcademicFreshmenVO> selectProfessorListByDept_nm(String dept_nm)throws SQLException;
	public List<AcademicFreshmenVO> selectProfessorListByDept_nm(String dept_nm, Criteria cri)throws SQLException;
	Map<String, Object> selectProfessorListByDept_nm(String dept_nm, SearchCriteria cri)throws SQLException;
	
	void updateAdvisor(String pro_no, String student_no)throws SQLException;
	
	void insertAdvisor(String pro_no, String student_no)throws SQLException;
}
