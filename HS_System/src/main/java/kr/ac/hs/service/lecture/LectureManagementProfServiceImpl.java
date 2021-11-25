package kr.ac.hs.service.lecture;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.lecture.LectureDetailCommandProf;
import kr.ac.hs.command.lecture.LectureManagemenProfCommand;
import kr.ac.hs.dao.lecture.LectureManagementProfDAO;
import kr.ac.hs.dto.lecture.LectureManagemenProfVO;
import kr.ac.hs.dto.lecture.LectureStudentListVO;

public class LectureManagementProfServiceImpl implements LectureManagementProfService{
	
	private LectureManagementProfDAO lectureManagementProfDAO;
	
	public void setLectureManagementProfDAO (LectureManagementProfDAO lectureManagementProfDAO) {
		this.lectureManagementProfDAO = lectureManagementProfDAO;
	}
	
	// 교수 강의조회
	@Override
	public List<LectureManagemenProfVO> getLectureList_prof(String pro_no) throws SQLException {
		List<LectureManagemenProfVO> lectureList_prof = lectureManagementProfDAO.selectLectureList_prof(pro_no);
		return lectureList_prof;
	}

	// 교수 강의상세
	@Override
	public List<LectureManagemenProfVO> getLectureDetailProfByClassNo(LectureDetailCommandProf cmd)
			throws SQLException {
		List<LectureManagemenProfVO> lectureDetailProf = lectureManagementProfDAO.selectLectureDetailProfByClassNo(cmd);
		return lectureDetailProf;
	}

	@Override
	public List<LectureStudentListVO> getLectureStudentList(LectureDetailCommandProf cmd) throws SQLException {
		List<LectureStudentListVO> lectureStudentList = lectureManagementProfDAO.selectLectureStudentList(cmd);
		return lectureStudentList;
	}

	




	
	

}
