package kr.ac.hs.dao.attendance;

import java.sql.SQLException;
import java.util.List;

import kr.ac.hs.dto.attendance.AttendanceStatusVO;

public interface AttendanceStatusDAO {

	public AttendanceStatusVO selectThisWeekAttendance(AttendanceStatusVO attdenace) throws SQLException;

	public AttendanceStatusVO selectlastWeekAttendance(AttendanceStatusVO attdenace) throws SQLException;

	public AttendanceStatusVO selectThisSemesterAttendance(AttendanceStatusVO attdenace) throws SQLException;

	public List<AttendanceStatusVO> selectThisSemesterAttendRate(AttendanceStatusVO attdenace) throws SQLException;

}
