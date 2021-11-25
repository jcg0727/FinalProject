package kr.ac.hs.dto.counsel;

import java.util.Date;

public class CounselLectureVO {
	private String classNo;
	private String className;
	private Date startTime;
	private Date endTime;
	private String lectureSemester;
	private String proNo;

	public String getClassNo() {
		return classNo;
	}

	public void setClassNo(String classNo) {
		this.classNo = classNo;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getLectureSemester() {
		return lectureSemester;
	}

	public void setLectureSemester(String lectureSemester) {
		this.lectureSemester = lectureSemester;
	}

	public String getProNo() {
		return proNo;
	}

	public void setProNo(String proNo) {
		this.proNo = proNo;
	}

}
