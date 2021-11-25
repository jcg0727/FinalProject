package kr.ac.hs.service.attendance;

import java.sql.SQLException;
import java.util.Map;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.attendance.AttendanceCommand;

public interface AttendanceService {

	// 출석등록
	public String registAttendance(AttendanceCommand cmd) throws SQLException;

	// 출석여부 확인
	public int getAttendanceStatus(AttendanceCommand cmd) throws SQLException;

	// 출석이의신청내역 조회
	public Map<String, Object> selectDissentAttendence(SearchCriteria cri, String student_no) throws SQLException;

}
