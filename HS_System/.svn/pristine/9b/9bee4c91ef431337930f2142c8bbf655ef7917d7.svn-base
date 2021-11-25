package kr.ac.hs.service.attendance;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.hs.dao.attendance.AttendanceStatusDAO;
import kr.ac.hs.dto.attendance.AttendanceStatusVO;

public class AttendanceStatusServiceImpl implements AttendanceStatusService {

	private AttendanceStatusDAO attendanceStatusDAO;

	public void setAttendanceStatusDAO(AttendanceStatusDAO attendanceStatusDAO) {
		this.attendanceStatusDAO = attendanceStatusDAO;
	}

	@Override
	public Map<String, Object> getTotalAttendanceStatus(AttendanceStatusVO attdenace) throws SQLException {

		Map<String,Object> dataMap = new HashMap<>();
		
		AttendanceStatusVO thisWeek = attendanceStatusDAO.selectThisWeekAttendance(attdenace);
		AttendanceStatusVO lastWeek = attendanceStatusDAO.selectlastWeekAttendance(attdenace);
		AttendanceStatusVO thisSemester = attendanceStatusDAO.selectThisSemesterAttendance(attdenace);
		List<AttendanceStatusVO> attendRate = attendanceStatusDAO.selectThisSemesterAttendRate(attdenace);
		
		dataMap.put("thisWeek", thisWeek);
		dataMap.put("lastWeek", lastWeek);
		dataMap.put("thisSemester", thisSemester);
		dataMap.put("attendRate", attendRate);
		
		return dataMap;
	}

}
