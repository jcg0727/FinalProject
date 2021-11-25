package kr.ac.hs.dao;

import java.sql.SQLException;
import java.util.List;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.ProfessorVO;
import kr.ac.hs.dto.academic.StudentVO;
import kr.ac.hs.dto.common.AdvisorVO;

public interface StudentDAO {

	//학생 정보 조회
	StudentVO selectStudentByStudentNo(String student_no) throws SQLException;

	public List<AdvisorVO> selectAdvisorByStudnetNo(String student_no) throws SQLException;

	public List<StudentVO> selectStudentByDeptName(String dept_nm) throws SQLException;

	//학생 목록 조회
	public List<StudentVO> selectStudentList(SearchCriteria cri) throws SQLException;

	// 학생정보상세
	public List<StudentVO> selectStudentDetail(String student_no) throws SQLException;

	// 지도교수명 조회
	public List<ProfessorVO> selectProfessorNm(String student_no) throws SQLException;

	// 학생리스트 totalCount
	int selectStudentListBySearchMenuCount(SearchCriteria cri) throws SQLException;

}
