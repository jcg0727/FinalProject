package kr.ac.hs.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.dto.LecturePlanVO;

public class LecturePlanDAOImpl implements LecturePlanDAO {
	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	/* 강의계획서  전체 조회 */
	@Override
	public List<LecturePlanVO> getLecturePlanList() throws SQLException {
		List<LecturePlanVO> lpList = session.selectList("LecturePlan-Mapper.selectLecturePlan");
		return lpList;
	}

	/* 강의계획서 신규작성 */
	@Override
	public void insertLecturePlan(LecturePlanVO lecturePlan) throws SQLException {
		session.update("LecturePlan-Mapper.insertLecturePlan");
	}

}
