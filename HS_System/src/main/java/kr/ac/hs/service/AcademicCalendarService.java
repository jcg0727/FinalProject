package kr.ac.hs.service;

import java.sql.SQLException;
import java.util.List;

import kr.ac.hs.dto.AcademicCalendarVO;

public interface AcademicCalendarService {
	List<AcademicCalendarVO> getAcasemicCalendarListOnlyAcademicSchedule() throws SQLException;
}
