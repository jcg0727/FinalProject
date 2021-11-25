package kr.ac.hs.dto.attendance;

public class AttendanceStatusVO {
	private String classNo;
	private String lectureSemester;

	private String totalCount;
	private String todayCount;
	private String attenCount;
	private String tardyCount;

	private String week;

	public String getClassNo() {
		return classNo;
	}

	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
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

	public String getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}

	public String getTodayCount() {
		return todayCount;
	}

	public void setTodayCount(String todayCount) {
		this.todayCount = todayCount;
	}

	public String getAttenCount() {
		return attenCount;
	}

	public void setAttenCount(String attenCount) {
		this.attenCount = attenCount;
	}

	public String getTardyCount() {
		return tardyCount;
	}

	public void setTardyCount(String tardyCount) {
		this.tardyCount = tardyCount;
	}

}
