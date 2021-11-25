package kr.ac.hs.service.attendance;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.PageMaker;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.attendance.AttendanceCommand;
import kr.ac.hs.dao.attendance.AttendanceDAO;
import kr.ac.hs.dto.attendance.AttendanceVO;

public class AttendanceServiceImpl implements AttendanceService {

	private AttendanceDAO attendanceDAO;

	public void setAttendanceDAO(AttendanceDAO attendanceDAO) {
		this.attendanceDAO = attendanceDAO;
	}

	@Override
	public String registAttendance(AttendanceCommand cmd) throws SQLException {
		attendanceDAO.insertAttendance(cmd);
		return "OK";
	}

	@Override
	public int getAttendanceStatus(AttendanceCommand cmd) throws SQLException {
		int count = attendanceDAO.checkAttendanceStatus(cmd);
		return count;
	}

	@Override
	public Map<String, Object> selectDissentAttendence(SearchCriteria cri, String student_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<AttendanceVO> dissentList = attendanceDAO.selectDissentAttendence(cri, student_no);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		if (dissentList.size() != 0) {
			pageMaker.setTotalCount(dissentList.get(0).getTotalcnt());

		}

		dataMap.put("dissentList", dissentList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

}
