package kr.ac.hs.dao.attendance;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.attendance.AttendanceCommand;
import kr.ac.hs.dto.attendance.AttendanceVO;

public class AttendanceDAOImpl implements AttendanceDAO {

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public String insertAttendance(AttendanceCommand cmd) throws SQLException {
		session.insert("Attendance-Mapper.insertAttendance", cmd);
		return "OK";
	}

	// 출석여부 확인
	@Override
	public int checkAttendanceStatus(AttendanceCommand cmd) throws SQLException {
		int count = session.selectOne("Attendance-Mapper.checkAttendanceStatus", cmd);
		return count;
	}

	// 이의신청내역
	@Override
	public List<AttendanceVO> selectDissentAttendence(SearchCriteria cri, String student_no) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("cri", cri);
		dataMap.put("student_no", student_no);

		List<AttendanceVO> list = session.selectList("Attendance-Mapper.selectDissentAttendence", dataMap, rowBounds);
		return list;
	}

}
