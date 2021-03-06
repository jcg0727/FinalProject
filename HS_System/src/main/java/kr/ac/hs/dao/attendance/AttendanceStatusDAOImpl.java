package kr.ac.hs.dao.attendance;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.dto.attendance.AttendanceStatusVO;

public class AttendanceStatusDAOImpl implements AttendanceStatusDAO {

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public AttendanceStatusVO selectThisWeekAttendance(AttendanceStatusVO attdenace) throws SQLException {
		AttendanceStatusVO status = session.selectOne("AttendanceStatus-Mapper.selectThisWeekAttendance", attdenace);
		return status;
	}

	@Override
	public AttendanceStatusVO selectlastWeekAttendance(AttendanceStatusVO attdenace) throws SQLException {
		AttendanceStatusVO status = session.selectOne("AttendanceStatus-Mapper.selectlastWeekAttendance", attdenace);
		return status;
	}

	@Override
	public AttendanceStatusVO selectThisSemesterAttendance(AttendanceStatusVO attdenace) throws SQLException {
		AttendanceStatusVO status = session.selectOne("AttendanceStatus-Mapper.selectThisSemesterAttendance", attdenace);
		return status;
	}

	@Override
	public List<AttendanceStatusVO> selectThisSemesterAttendRate(AttendanceStatusVO attdenace) throws SQLException {
		List<AttendanceStatusVO> status = session.selectList("AttendanceStatus-Mapper.selectThisSemesterAttendRate",attdenace);
		return status;
	}

}
