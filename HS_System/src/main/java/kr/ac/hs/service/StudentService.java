package kr.ac.hs.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.ProfessorVO;
import kr.ac.hs.dto.academic.StudentVO;
import kr.ac.hs.dto.common.AdvisorVO;

public interface StudentService {
	public List<StudentVO> getStudentListByDeptNm(String dept_nm) throws SQLException;

	public Map<String, Object> getStudentList(SearchCriteria cri) throws SQLException;

	List<AdvisorVO> getAdvisor(String student_no) throws SQLException;

	StudentVO getStudent(String student_no) throws SQLException;

	List<StudentVO> getStudentDetail(String student_no) throws SQLException;

	List<ProfessorVO> getProfessorNm(String student_no) throws SQLException;

	Map<String, Object> selectProfessorListByDept_nm(String dept_nm, SearchCriteria cri) throws SQLException;

	void updateAdvisor(String pro_no, String student_no) throws SQLException;


}
