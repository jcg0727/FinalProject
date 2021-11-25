package kr.ac.hs.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.AcademicStateVO;
import kr.ac.hs.dto.academic.AcademicStateStaffVO;

public interface AcademicStateService {

	// 일반휴학신청(등록)
	public String registLeaveAcademicState(AcademicStateVO academicState, String[] files) throws SQLException;

	// 군휴학(등록)
	//public void registArmyAcademicState(AcademicStateVO academicState, String[] files) throws SQLException;

	// 질병휴학(등록)
	//public void registDiseaseAcademicState(AcademicStateVO academicState, String[] files) throws SQLException;

	// 휴학내역조회
	public List<AcademicStateVO> getListByStudentNO(String student_no) throws SQLException;

	// 휴학신청 삭제
	public void remove(AcademicStateVO academicStateVO) throws SQLException;

	// 

	//--------------------------------------------------------------------------------------------------------------------------

	// 복학 신청
	public void registReturnAcademicState(AcademicStateStaffVO academicState) throws SQLException;

	// 복학 신청내역
	public List<AcademicStateVO> getListReturnAcademicStateStudentNo(String student_no) throws SQLException;

	// 복학 신청내역 삭제
	public void removeReturnAcademicState(AcademicStateVO academicStateVO) throws SQLException;

	//--------------------------------------------------------------------------------------------------------------------------

	// 자퇴신청내역
	public List<AcademicStateVO> getListAcademicDropByStudentNO(String student_no) throws SQLException;

	// 자퇴신청
	public String registAcademicDrop(AcademicStateVO academicState) throws SQLException;

	// 자퇴신청 취소
	public void removeAcademicDrop(String student_no) throws SQLException;
	
}
