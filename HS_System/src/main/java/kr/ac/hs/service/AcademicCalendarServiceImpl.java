package kr.ac.hs.service;

import java.sql.SQLException;
import java.util.List;

import kr.ac.hs.dao.AcademicCalenderDAO;
import kr.ac.hs.dto.AcademicCalendarVO;

public class AcademicCalendarServiceImpl implements AcademicCalendarService{
	
	private AcademicCalenderDAO calenderDAO;

	public void setAcademicCalenderDAO(AcademicCalenderDAO academicCalenderDAO) {
		this.calenderDAO = academicCalenderDAO;
	}

	@Override
	public List<AcademicCalendarVO> getAcasemicCalendarListOnlyAcademicSchedule() throws SQLException {
		List<AcademicCalendarVO> calendarList = calenderDAO.selectAcademicCalendarOnlyAcademicScehdule();
		
		return calendarList;
	}
	
	
	
}
