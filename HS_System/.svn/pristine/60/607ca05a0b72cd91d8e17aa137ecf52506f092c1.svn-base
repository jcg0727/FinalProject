package kr.ac.hs.dao;

import java.sql.SQLException;
import java.util.List;

import kr.ac.hs.command.Criteria;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.AcademicAttachVO;
import kr.ac.hs.dto.AcademicStateVO;
import kr.ac.hs.dto.academic.AcademicStateStaffVO;

public interface AcademicStateDAO {
	
	// 학적첨부파일
	public void insertAcademicAttach(AcademicAttachVO attach) throws SQLException;

	// 일반휴학 신청
	public void insertLeaveAcademicState(AcademicStateVO academicState) throws SQLException;

	// 군 휴학 신청
	//public void insertArmyAcademicState(AcademicStateVO academicState) throws SQLException;

	// 질병휴학 신청
	//public void insertDiseaseAcademicState(AcademicStateVO academicState) throws SQLException;

	// 휴학신청 내역 조회
	public List<AcademicStateVO> selectLeaveAcademicStateByStudentNO(String student_no) throws SQLException;
	
	// 휴학신청 삭제
	public void deleteLeaveAcademicState(AcademicStateVO academicState) throws SQLException;


	//-----------------------------------------------------------------------------------------------------------------------

	// 복학 신청
	public void insertReturnAcademicState(AcademicStateStaffVO academicState) throws SQLException;

	// 복학 신청내역 조회
	public List<AcademicStateVO> selectReturnAcademicState(String student_no) throws SQLException;
	
	// 복학 신청 삭제
	public void  deleteReturnAcademicState(AcademicStateVO academicState) throws SQLException;

	//-----------------------------------------------------------------------------------------------------------------
	////////////// 자퇴 /////////////////////

	// 자퇴신청내역 조회
	List<AcademicStateVO> selectAcademicDropByStudentNO(String student_no) throws SQLException;

	// 자퇴신청 
	public void insertAcademicDrop(AcademicStateVO academicState) throws SQLException;
	
	//자퇴신청 취소
	public void deleteAcademicDrop(String student_no) throws SQLException;
	
	
}