package kr.ac.hs.service.academic;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.Criteria;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.AcademicStateVO;
import kr.ac.hs.dto.academic.AcademicStateStaffVO;

public interface StaffAcademicStateService {
		
		//  공통 --------------
		// 상세조회
		AcademicStateStaffVO getDetail(String student_no, String register_date) throws SQLException;
		
		// 승인
		void modifyStatus(AcademicStateStaffVO academicState) throws SQLException;
		// ------------------ 학과교직원 -----------------------------------------------------------

		// 학과명 가져오기
		String getDeptStaffNmByStaff_no(String staff_no) throws SQLException;
		
		// 학적변동이력조회
		List<AcademicStateVO> getDeptStaffAcademicState(String staff_no) throws SQLException;

		// 검색 조건
		List<AcademicStateVO> getDepStaffAcademicStateCriteria(String staff_no, Criteria cri) throws SQLException;
		Map<String, Object> getDepStaffAcademicStateCriteria(String staff_no, SearchCriteria cri) throws SQLException;

		
		
		// ------------------ 교무처 -----------------------------------------------------------
		
		// 학적변동이력조회
		List<AcademicStateVO> getStaffAcademicState() throws SQLException;
		
		// 검색 조건
		List<AcademicStateVO> getStaffAcademicStateCriteria(Criteria cri) throws SQLException;
		Map<String, Object> getStaffAcademicStateCriteria(SearchCriteria cri) throws SQLException;



}
