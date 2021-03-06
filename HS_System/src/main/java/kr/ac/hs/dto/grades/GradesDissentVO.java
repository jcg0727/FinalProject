package kr.ac.hs.dto.grades;

public class GradesDissentVO {
	private String dissent_grades_no;
	private String guide;
	private String register_reason;
	private String status_cd;
	private String student_no;
	private String lecture_semester;
	private String class_no;
	private String student_name;
	private String class_name;
	private String grades_cd;
	private String status_nm;
	private String classType;
	private String proName;
	
	private GradesVO grades;

	private int rnum;
	private int totalcnt;

	public GradesVO getGrades() {
		return grades;
	}

	public void setGrades(GradesVO grades) {
		this.grades = grades;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getClassType() {
		return classType;
	}

	public void setClassType(String classType) {
		this.classType = classType;
	}

	public String getStatus_nm() {
		return status_nm;
	}

	public void setStatus_nm(String status_nm) {
		this.status_nm = status_nm;
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

	public String getGrades_cd() {
		return grades_cd;
	}

	public void setGrades_cd(String grades_cd) {
		this.grades_cd = grades_cd;
	}

	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getTotalcnt() {
		return totalcnt;
	}

	public void setTotalcnt(int totalcnt) {
		this.totalcnt = totalcnt;
	}

	public String getDissent_grades_no() {
		return dissent_grades_no;
	}

	public void setDissent_grades_no(String dissent_grades_no) {
		this.dissent_grades_no = dissent_grades_no;
	}

	public String getGuide() {
		return guide;
	}

	public void setGuide(String guide) {
		this.guide = guide;
	}

	public String getRegister_reason() {
		return register_reason;
	}

	public void setRegister_reason(String register_reason) {
		this.register_reason = register_reason;
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

	public String getLecture_semester() {
		return lecture_semester;
	}

	public void setLecture_semester(String lecture_semester) {
		this.lecture_semester = lecture_semester;
	}

	public String getClass_no() {
		return class_no;
	}

	public void setClass_no(String class_no) {
		this.class_no = class_no;
	}
}
