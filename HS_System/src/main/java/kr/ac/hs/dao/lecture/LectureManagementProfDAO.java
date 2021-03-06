package kr.ac.hs.dao.lecture;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.lecture.LectureDetailCommandProf;
import kr.ac.hs.dto.lecture.LectureManagemenProfVO;
import kr.ac.hs.dto.lecture.LectureStudentListVO;

public interface LectureManagementProfDAO {
	
	// 교수 강의조회
	public List<LectureManagemenProfVO> selectLectureList_prof (String pro_no) throws SQLException;
	
	// 교수 강의상세
	public List<LectureManagemenProfVO> selectLectureDetailProfByClassNo (LectureDetailCommandProf cmd) throws SQLException;
	
	// 강의 클릭 --> 수강생리스트 출력
	public List<LectureStudentListVO> selectLectureStudentList (LectureDetailCommandProf cmd) throws SQLException;
	

}
