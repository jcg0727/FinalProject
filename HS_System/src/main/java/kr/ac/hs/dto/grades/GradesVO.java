package kr.ac.hs.dto.grades;

public class GradesVO {
	private String student_no;
	private String lecture_semester;
	private String class_no;
	private double attend_score;
	private double middle_score;
	private double final_score;
	private double grades_avg;
	private String grades_cd;
	private int finalCount;

	private String class_grade;
	private String class_type;
	private String class_name;
	private String pro_nm;
	private String regist_score;
	private String getted_score;
	private String dissent_result;
	private String retake;

	private int rnum;
	private int totalcnt;

	public int getFinalCount() {
		return finalCount;
	}

	public void setFinalCount(int finalCount) {
		this.finalCount = finalCount;
	}

	public String getClass_grade() {
		return class_grade;
	}

	public void setClass_grade(String class_grade) {
		this.class_grade = class_grade;
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

	public double getAttend_score() {
		return attend_score;
	}

	public void setAttend_score(double attend_score) {
		this.attend_score = attend_score;
	}

	public double getMiddle_score() {
		return middle_score;
	}

	public void setMiddle_score(double middle_score) {
		this.middle_score = middle_score;
	}

	public double getFinal_score() {
		return final_score;
	}

	public void setFinal_score(double final_score) {
		this.final_score = final_score;
	}

	public double getGrades_avg() {
		return grades_avg;
	}

	public void setGrades_avg(double grades_avg) {
		this.grades_avg = grades_avg;
	}

	public String getGrades_cd() {
		return grades_cd;
	}

	public void setGrades_cd(String grades_cd) {
		this.grades_cd = grades_cd;
	}

	public String getClass_type() {
		return class_type;
	}

	public void setClass_type(String class_type) {
		this.class_type = class_type;
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

	public String getPro_nm() {
		return pro_nm;
	}

	public void setPro_nm(String pro_nm) {
		this.pro_nm = pro_nm;
	}

	public String getRegist_score() {
		return regist_score;
	}

	public void setRegist_score(String regist_score) {
		this.regist_score = regist_score;
	}

	public String getGetted_score() {
		return getted_score;
	}

	public void setGetted_score(String getted_score) {
		this.getted_score = getted_score;
	}

	public String getDissent_result() {
		return dissent_result;
	}

	public void setDissent_result(String dissent_result) {
		this.dissent_result = dissent_result;
	}

	public String getRetake() {
		return retake;
	}

	public void setRetake(String retake) {
		this.retake = retake;
	}

}
