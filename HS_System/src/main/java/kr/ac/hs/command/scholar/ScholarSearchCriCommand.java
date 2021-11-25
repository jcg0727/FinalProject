package kr.ac.hs.command.scholar;

import kr.ac.hs.command.SearchCriteria;

public class ScholarSearchCriCommand extends SearchCriteria {
	
	private String grade;
	private String status_cd;
	private String student_no;
	private String dept_nm;
	private String lecture_semester;
	
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getStatus_cd() {
		return status_cd;
	}
	public void setStatus_cd(String status_cd) {
		this.status_cd = status_cd;
	}
	public String getStudent_no() {
		return student_no;
	}
	public void setStudent_no(String student_no) {
		this.student_no = student_no;
	}
	public String getDept_nm() {
		return dept_nm;
	}
	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}
	public String getLecture_semester() {
		return lecture_semester;
	}
	public void setLecture_semester(String lecture_semester) {
		this.lecture_semester = lecture_semester;
	}

	
	
}
