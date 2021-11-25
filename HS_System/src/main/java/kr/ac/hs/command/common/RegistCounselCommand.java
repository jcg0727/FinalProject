package kr.ac.hs.command.common;

import kr.ac.hs.dto.counsel.CounselLectureVO;

public class RegistCounselCommand extends professorListByDeptNameCommand {
	private String classNo;
	private String className;
	private String startTime;
	private String endTime;
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

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
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
	
	public CounselLectureVO convertoCounselLectureVO() {
		CounselLectureVO vo = new CounselLectureVO();
		
		vo.setClassNo(classNo);
		vo.setLectureSemester(lectureSemester);
		vo.setProNo(proNo);
		
		return vo;
	}

}
