package kr.ac.hs.dao.academic;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.Criteria;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.AcademicStateVO;
import kr.ac.hs.dto.academic.AcademicStateStaffVO;

public interface StaffAcademicStateDAO {
	
		//  공통 --------------
		// 상세조회
		AcademicStateStaffVO selectDetailByStudenNoAndRegisterDate(Map<String, Object>dataMap) throws SQLException;
		
		// 승인
		void updateStatus(AcademicStateStaffVO academicState) throws SQLException;

		// ------------------ 학과교직원 -----------------------------------------------------------

		// 학과명 가져오기
		String selectDeptStaffNmByStaff_no(String staff_no) throws SQLException;
		
		// 학적변동이력조회
		List<AcademicStateVO> selectDeptStaffAcademicState(String staff_no) throws SQLException;

		// 검색 조건
		List<AcademicStateVO> selectDepStaffAcademicStateCriteria(String staff_no, Criteria cri) throws SQLException;
		List<AcademicStateVO> selectDepStaffAcademicStateCriteria(String staff_no, SearchCriteria cri) throws SQLException;

		int selectSearchDepStaff_noCount(String staff_no, SearchCriteria cri)throws SQLException;
		
		
		
		// ------------------ 교무처 -----------------------------------------------------------
		
		// 학적변동이력조회
		List<AcademicStateVO> selectStaffAcademicState() throws SQLException;
		
		// 검색 조건
		List<AcademicStateVO> selectStaffAcademicStateCriteria(Criteria cri) throws SQLException;
		List<AcademicStateVO> selectStaffAcademicStateCriteria(SearchCriteria cri) throws SQLException;

		int selectSearchStaff_noCount(SearchCriteria cri)throws SQLException;


	}