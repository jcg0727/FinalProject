package kr.ac.hs.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.Criteria;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.AcademicFreshmenVO;

public interface AcademicFreshmenDAO {
	// 로그인 조교의 학과명 출력
	String SelectDept_nmByStaff_no(String staff_no)throws SQLException;
	
	// 로그인 조교 학과의 신입생 목록 출력
	List<AcademicFreshmenVO> SelectItemsByStaff_no(String staff_no)throws SQLException;
	List<AcademicFreshmenVO> SelectItemsByStaff_no(String staff_no, Criteria cri)throws SQLException;
	List<AcademicFreshmenVO> SelectItemsByStaff_no(String staff_no, SearchCriteria cri)throws SQLException;
	
	int selectSearchItemsByStaff_noCount(String staff_no, SearchCriteria cri)throws SQLException;
	
	// 신입생 상세보기
	List<AcademicFreshmenVO> SelectDetailByStudent_no(String student_no)throws SQLException;
	
	// 학과별 교수리스트(parameter : 학과명)
	List<AcademicFreshmenVO> SelectProfessorListByDept_nm(String dept_nm)throws SQLException;
	List<AcademicFreshmenVO> SelectProfessorListByDept_nm(String dept_nm, Criteria cri)throws SQLException;
	List<AcademicFreshmenVO> SelectProfessorListByDept_nm(String dept_nm, SearchCriteria cri)throws SQLException;
	
	int selectCountProfessorListByDept_nm(String dept_nm, SearchCriteria cri)throws SQLException;
	
	// 지도교수 변경
	void updateAdvisor(String pro_no, String student_no)throws SQLException;
	
	// 지도교수 등록
	void insertAdvisor(String pro_no, String student_no)throws SQLException;

}
