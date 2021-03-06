package kr.ac.hs.service.lecture;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.lecture.LectureTimeVO;
import kr.ac.hs.dto.lecture.LectureVO;

public interface LectureTimeService {
	
	//목록조회
	Map<String, Object> getLectureTimeList(SearchCriteria cri) throws SQLException;
	
	//리스트보기
	Map<String,Object> getStaffLectureTimeList(Map<String,Object> dataMap)throws SQLException;

	//학수번호로 교수변경목록 
	Map<String,Object> selectLectureProfessorByClassNo(Map<String, Object> dataMap)throws SQLException;

	//교수 목록
	Map<String, Object> selectProlistByStaffNo(Map<String, Object> dataMap) throws SQLException;

	//교수 수정
	void modify(LectureVO lecture) throws SQLException;
	
	//과목, 학기로 시간 목록 조회
	Map<String, Object> lectureTime(Map<String, Object> dataMap) throws SQLException;
	
	//강의 시간표 수정
	void modify(LectureTimeVO lectureTime) throws SQLException;

}
