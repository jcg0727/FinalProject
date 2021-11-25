package kr.ac.hs.service.lecture;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.lecture.LectureDetailCommandProf;
import kr.ac.hs.command.lecture.LectureManagemenProfCommand;
import kr.ac.hs.dto.lecture.LectureManagemenProfVO;
import kr.ac.hs.dto.lecture.LectureStudentListVO;

public interface LectureManagementProfService {
	
	// 교수 강의조회
	public List<LectureManagemenProfVO> getLectureList_prof (String pro_no) throws SQLException;

	// 교수 강의상세
	public List<LectureManagemenProfVO> getLectureDetailProfByClassNo(LectureDetailCommandProf cmd) throws SQLException;
	
	// 강의 클릭 --> 수강생리스트 출력
	public List<LectureStudentListVO> getLectureStudentList(LectureDetailCommandProf cmd) throws SQLException;

}
