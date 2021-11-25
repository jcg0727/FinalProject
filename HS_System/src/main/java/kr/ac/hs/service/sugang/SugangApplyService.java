package kr.ac.hs.service.sugang;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.sugang.ApplyCompleteLectureCommand;
import kr.ac.hs.command.sugang.ApplyLessonCommand;
import kr.ac.hs.command.sugang.LectureRegisterCommand;
import kr.ac.hs.dto.sugang.ApplyLessonVO;
import kr.ac.hs.dto.sugang.LectureRegisterVO;

public interface SugangApplyService { 
	
	// 개설강의 각과별 전체조회
	public Map<String,Object> getLectureList(String dept_no, String class_name, String class_year, String class_type, SearchCriteria cri) throws SQLException;
		
	// 개설강의 학과 & 학년별조회
	public Map<String, Object> getLectureList_year(String dept_no, String student_no, SearchCriteria cri) throws SQLException;
		
/*	// 수강여부확인
	public int getCheckLectureApplyList (Map<String, String> dataMap) throws SQLException;
	
	// 보관함여부확인
	public int getCheckBoguanList (Map<String, String> dataMap) throws SQLException;*/
	
	// 수강신청
	public String registLectureList(ApplyCompleteLectureCommand cmd) throws SQLException;
	
	// 보관함 담기
	public String registBoguanList(LectureRegisterCommand cmd) throws SQLException;
	
	
	
	// 보관함 리스트 조회
	public Map<String, Object> getBoguanList(String dept_no, String student_no, SearchCriteria cri) throws SQLException;
	
	// 수강신청 리스트 조회
	public Map<String, Object> getSugangApplySuccessList(String dept_no, String student_no, SearchCriteria cri) throws SQLException;
	
	
	// 보관함 삭제
	public String removeBoguan (LectureRegisterVO lectureRegister) throws SQLException;
	
	// 수강신청 취소
	public String removeSugang (LectureRegisterVO lectureRegister) throws SQLException;
	
	// 보관함 -> 수강신청 성공
	public String updateBoguanToSugangSuccess (ApplyCompleteLectureCommand cmd) throws SQLException;
	
	// 수강신청 리스트
	public Map<String, Object> getTimeTable(ApplyCompleteLectureCommand cmd) throws SQLException;
	
	// 강의계획서 조회
	public Map<String, Object> getLecturePlan (String class_no) throws SQLException;
	
	// 강의평가 조회
	public Map<String, Object> getLectureEvaluation(String class_no) throws SQLException;
	
	public Map<String, Object> getLectureEvaluationQ_6(String class_no) throws SQLException;
	
	// 수강신청 타임테이블 리스트
	public List<ApplyLessonVO> getApplyLessonList(ApplyLessonCommand cmd) throws SQLException;
	
	// 수강신청 타임테이블 리스트(교수)
	public List<ApplyLessonVO> getProfTimeTableList(ApplyLessonCommand cmd) throws SQLException;
	
	
}
