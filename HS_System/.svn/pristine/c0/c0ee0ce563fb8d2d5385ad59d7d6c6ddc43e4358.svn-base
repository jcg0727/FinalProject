package kr.ac.hs.dao.attendance;

import java.sql.SQLException;
import java.util.List;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.attendance.AttendanceCommand;
import kr.ac.hs.dto.attendance.AttendanceVO;

public interface AttendanceDAO {

	// 출석등록
	public String insertAttendance(AttendanceCommand cmd) throws SQLException;

	// 출석여부 확인
	public int checkAttendanceStatus(AttendanceCommand cmd) throws SQLException;

	// 이의신청내역
	public List<AttendanceVO> selectDissentAttendence(SearchCriteria cri, String student_no) throws SQLException;
}
