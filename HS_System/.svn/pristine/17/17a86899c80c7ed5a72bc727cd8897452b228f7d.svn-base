package kr.ac.hs.dao.applicant;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.dto.applicant.StaffApplicantVO;


public interface StaffApplicantDAO {
	
		List<StaffApplicantVO> selectApplicantDeptStaff(Map<String, Object> dataMap) throws SQLException;

		int selectApplicantDeptListCount(Map<String, Object> dataMap) throws SQLException;
	
		
		List<StaffApplicantVO> selectApplicant(Map<String, Object> dataMap) throws SQLException;
	
		int selectApplicantListCount(Map<String, Object> dataMap) throws SQLException;

		StaffApplicantVO selectApplicantDetail(String applicant_no) throws SQLException;
		
		void updatetApplicantPassOrFail(StaffApplicantVO staffApplicantVO) throws SQLException;

		// 합격 취소(등록금 미납자만 해당)
		void updateApplicantPassDelete(String applicant_no) throws SQLException;
		
		
		void insertApplicantToAccount(String applicant_no) throws SQLException;
		
		void insertApplicantToStudent(String applicant_no) throws SQLException;

}