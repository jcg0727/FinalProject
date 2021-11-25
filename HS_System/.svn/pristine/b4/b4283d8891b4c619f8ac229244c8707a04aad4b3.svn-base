package kr.ac.hs.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.dto.AcademicCalendarVO;

public class AcademicCalendarDAOImpl implements AcademicCalenderDAO{

	private SqlSession session;
	private String namespace = "AcademicCalendar-Mapper.";
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<AcademicCalendarVO> selectAcademicCalendarOnlyAcademicScehdule() throws SQLException {
		List<AcademicCalendarVO> calendarList = session.selectList(namespace+"selectAcademicCalenderOnlyAcademicSchedule");
		return calendarList;
	}

}
