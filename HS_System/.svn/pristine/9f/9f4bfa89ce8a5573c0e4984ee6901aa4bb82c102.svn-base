package kr.ac.hs.service.applicant;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.Criteria;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.AcademicStateVO;
import kr.ac.hs.dto.academic.AcademicStateStaffVO;
import kr.ac.hs.dto.applicant.StaffApplicantVO;


public interface StaffApplicantService {
	
	//지원자 리스트 출력(학과교직원)
	Map<String, Object> getApplicantDeptStaff(Map<String, Object> dataMap) throws SQLException;

	//지원자 리스트 출력
	Map<String, Object> getListSelectApplicant(Map<String, Object> dataMap) throws SQLException;
	
	//상세보기
	StaffApplicantVO getDetail(String applicant_no) throws SQLException;
	
	//합격여부상태 변경
	void modifyApplicantPassOrFail(StaffApplicantVO staffApplicantVO) throws SQLException;
	
	//합격 취소(등록금 미납자만 취소 가능)
	void modifyApplicantPassDelete(String applicant_no) throws SQLException;
	
/*	//계정 번호 가져오기
	String getAccountNo_SEQ(String account_no) throws SQLException;
	
	//계정 등록
	void registApplicantToAccount(StaffApplicantVO staffApplicantVO) throws SQLException;*/
	
	//학생 등록
	void registApplicantToStudent(String applicant_no) throws SQLException;
}
