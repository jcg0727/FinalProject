package kr.ac.hs.service;

import java.sql.SQLException;
import java.util.List;

import kr.ac.hs.dao.LecturePlanDAO;
import kr.ac.hs.dto.LecturePlanVO;

public class LecturePlanServiceImpl implements LecturePlanService {
	private LecturePlanDAO lecturePlanDAO;

	public void setLecturePlanDAO(LecturePlanDAO lecturePlanDAO) {
		this.lecturePlanDAO = lecturePlanDAO;
	}

	@Override
	public List<LecturePlanVO> getLecturePlanList() throws SQLException {
		List<LecturePlanVO> lpList = lecturePlanDAO.getLecturePlanList();
		return lpList;
	}

	// 강의계획서 신규작성
	@Override
	public void insertLecturePlan(LecturePlanVO lecturePlan) throws SQLException {
		lecturePlanDAO.insertLecturePlan(lecturePlan);
	}

}
