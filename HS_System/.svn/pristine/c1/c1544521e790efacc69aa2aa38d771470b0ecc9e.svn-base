package kr.ac.hs.dao.lecture;

import java.sql.SQLException;
import java.util.List;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.lecture.LectureVO;

public interface LectureStdDAO {

	// 수업목록
	public List<LectureVO> lectureStuBasicList(SearchCriteria cri, String student_no) throws SQLException;

	// 강의계획서 조회
	public LectureVO selectLectureDetail(String class_no, String lecture_semester) throws SQLException;

}
