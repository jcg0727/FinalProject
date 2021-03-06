package kr.ac.hs.dao.lecture;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.lecture.LectureTimeVO;
import kr.ac.hs.dto.lecture.LectureVO;

public interface LectureTimeDAO {
	
	//개설강의 목록 조회
	List<LectureVO> selectLectureList(SearchCriteria cri) throws SQLException;

	//카운트 조회
	int selectCountLectureList(SearchCriteria cri) throws SQLException;
	
	//직원 아이디로 목록 조회
	public List<LectureVO> selectLectureListByStaffNo(Map<String,Object> dataMap)throws SQLException;
	
	//직원 아이디로 카운 조회
	int selectCountStaffLectureList(Map<String,Object> dataMap) throws SQLException;
	
	//과목번호로 교수변경 리스트 
	List<LectureVO> selectLectureProfessorByClassNo(Map<String, Object> dataMap) throws SQLException;
	
	//직원번호로 교수 목록 조회
	List<LectureVO> selectProlistByStaffNo(Map<String,Object> dataMap) throws SQLException;
	
	//직원번호로 교수 카운트 조회
	int selectCountProList(Map<String, Object> dataMap) throws SQLException;
	
	//교수 수정
	void updateProfessor(LectureVO lecture) throws SQLException;
	
	//과목, 학기로 강의시간표 목록 조회
	List<LectureVO> lectureTime(Map<String, Object> dataMap) throws SQLException;
	
	//강의 시간 수정
	void updateTimetable(LectureTimeVO lectureTime) throws SQLException;
	
}
