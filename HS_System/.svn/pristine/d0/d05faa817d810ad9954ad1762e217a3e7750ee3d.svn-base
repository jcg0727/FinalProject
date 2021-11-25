package kr.ac.hs.dao.sugang;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionException;

import kr.ac.hs.command.lecture.LecturePlanCommand;
import kr.ac.hs.command.sugang.ApplyCompleteLectureCommand;
import kr.ac.hs.command.sugang.ApplyExpectedLectureCommand;
import kr.ac.hs.command.sugang.ApplyLessonCommand;
import kr.ac.hs.command.sugang.LectureRegisterCommand;
import kr.ac.hs.dto.DepartmentVO;
import kr.ac.hs.dto.lecture.LecturePlanVO2;
import kr.ac.hs.dto.lecture.LectureVO;
import kr.ac.hs.dto.sugang.ApplyCompleteLectureVO;
import kr.ac.hs.dto.sugang.ApplyExpectedLectureVO;
import kr.ac.hs.dto.sugang.ApplyLessonVO;
import kr.ac.hs.dto.sugang.BoguanVO;
import kr.ac.hs.dto.sugang.LectureEvaluationScoreVO;
import kr.ac.hs.dto.sugang.LectureListVO;
import kr.ac.hs.dto.sugang.LectureRegisterVO;
import kr.ac.hs.dto.sugang.SugangApplySuccessVO;

public interface SugangApplyDAO {
	
	// 개설강의 전체조회
	public List<LectureListVO> selectLectureList(Map<String, Object> dataMap) throws SQLException;
	
	//개설강의 리스트 수
	public int selectCountLectureList(Map<String, Object> dataMap) throws SQLException;
	
	// 개설강의 본인학과조회
	public List<LectureListVO> selectLectureList_year(Map<String, Object> dataMap) throws SQLException;
	
	// 개설강의 리스트 수
	public int selectCountGausulTotalList(Map<String, Object> dataMap) throws SQLException;

	
	
	// 수강신청 여부 확인
	public int checkLectureApplyList(LectureRegisterCommand cmd) throws SQLException;

	// 보관함 여부 확인
	public int checkLectureBoguanList(LectureRegisterCommand cmd) throws SQLException;
	
	// 수강신청
	public String insertLectureList(LectureRegisterCommand cmd) throws SQLException; 
	
	// 브관함
	public String insertBoguanList(LectureRegisterCommand cmd) throws SQLException;
	
	
	
	
	// 보관함 리스트 조회
	public List<BoguanVO> selectBoguanList(Map<String, Object> dataMap) throws SQLException;
	
	// 보관함 리스트 수
	public int selectCountBoguanList(Map<String, Object> dataMap) throws SQLException;
	
	// 수강신청 리스트 조회
	public List<SugangApplySuccessVO> selectSugangApplySuccessList(Map<String, Object> dataMap) throws SQLException;
	
	// 수강신청 리스트 수
	public int selectCountSugangApplySuccessList(Map<String, Object> dataMap) throws SQLException;
	
	
	// 보관함 삭제
	public void deleteBoguan(LectureRegisterVO lectureRegister) throws SQLException;
	
	// 수강신청 취소
	public void deleteSugang(LectureRegisterVO lectureRegister) throws SQLException;
	
	// 보관함 -> 수강신청 성공
	public void changeBoguanToSugangSuccess(LectureRegisterCommand cmd) throws SQLException;
	
	
	// 수강신청인원
	public int selectCheckApplyStatus(LectureRegisterCommand cmd) throws SQLException;
	
	// 신청학점 계산
	public int selectApplyScores(LectureRegisterCommand cmd) throws SQLException;
	
	// 신청완료한 강의  요일 &시간
	public List<ApplyCompleteLectureVO> SelectApplyCompleteLecture (ApplyCompleteLectureCommand cmd) throws SQLException;
	
	// 신청하려는 강의 요일 & 시간
	public List<ApplyExpectedLectureVO> SelectApplyExpectedLecture(ApplyCompleteLectureCommand cmd) throws SQLException;
	
	// 강의계획서 조회
	public LecturePlanVO2 selectLecturePlan2 (String class_no) throws SQLException;
	
	// 강의평가 조회
	public LectureEvaluationScoreVO selectLectureEvalutaionScore (String class_no)  throws SQLException;
	
	// 강의평가, 6번문항
	public List<String> selectLectureEvaluationQ6 (String class_no)  throws SQLException;
	
	// 수강신청 타임테이블 리스트
	public List<ApplyLessonVO> selectApplyLessonList (ApplyLessonCommand cmd) throws SQLException;
	
	// 수강신청 타임테이블 리스트 (교수)
	public List<ApplyLessonVO> selectProfLessonList (ApplyLessonCommand cmd) throws SQLException;
}





