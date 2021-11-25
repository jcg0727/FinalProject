package kr.ac.hs.dao.lecture;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.command.lecture.LectureDetailCommandProf;
import kr.ac.hs.dto.lecture.LectureManagemenProfVO;
import kr.ac.hs.dto.lecture.LectureStudentListVO;

public class LectureManagementProfDAOImpl implements LectureManagementProfDAO {
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<LectureManagemenProfVO> selectLectureList_prof(String pro_no) throws SQLException {
		List<LectureManagemenProfVO> lectureList_prof =  session.selectList("lectureManagementProf-Mapper.selectLectureList_prof", pro_no);
		return lectureList_prof;
	}

	@Override
	public List<LectureManagemenProfVO> selectLectureDetailProfByClassNo(LectureDetailCommandProf cmd)
			throws SQLException {
		List<LectureManagemenProfVO> lectureDetailProf =  session.selectList("lectureManagementProf-Mapper.selectLectureDetailProfByClassNo", cmd);
		return lectureDetailProf;
	}

	@Override
	public List<LectureStudentListVO> selectLectureStudentList(LectureDetailCommandProf cmd) throws SQLException {
		
		List<LectureStudentListVO> lectureStudentList = session.selectList("lectureManagementProf-Mapper.selectLectureStudentList", cmd);
		return lectureStudentList;
	}
	
	
	
	
	
	
	
	
}
