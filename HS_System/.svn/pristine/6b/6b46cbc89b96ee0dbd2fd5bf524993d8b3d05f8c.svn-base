package kr.ac.hs.service.lecture;

import java.sql.SQLException;
import java.util.Map;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.lecture.LectureVO;

public interface LectureStdService {
	// 학생-수업관리
	public Map<String, Object> getStdLectureList(SearchCriteria cri, String student_no) throws SQLException;
	
	// 학생-강의계획서 조회
	public LectureVO selectLectureDetail(String class_no, String lecture_semester) throws SQLException;

}
