package kr.ac.hs.command.attendance;

import kr.ac.hs.dto.attendance.AttendanceStatusVO;

public class AttendenceStatusCommand {
	private String classNo;
	private String lectureSemester;

	public String getClassNo() {
		return classNo;
	}

	public void setClassNo(String classNo) {
		this.classNo = classNo;
	}

	public String getLectureSemester() {
		return lectureSemester;
	}

	public void setLectureSemester(String lectureSemester) {
		this.lectureSemester = lectureSemester;
	}
	
	public AttendanceStatusVO convertToAttendanceStatusVO() {
		AttendanceStatusVO vo = new AttendanceStatusVO();
		
		vo.setClassNo(classNo);
		vo.setLectureSemester(lectureSemester);
		
		return vo;
	}
}
