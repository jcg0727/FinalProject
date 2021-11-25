package kr.ac.hs.dto.graduation;

import java.util.Date;

public class GraduationVO {
 
	private String class_grade;
	private String class_no;
	private String student_no;
	private String class_type;
	private String attach_no;
	private String status_cd;
	private int gp;
	private int gs;
	private int jp;
	private int js;
	private String orginal_nm;
	private String extension;
	private String status_nm;
	private String lecture_semester;
	private String num;
	private String name;
	private String account_no;
	private Date graduate_date;
	private String postpone;
	private int final_score;
	private String grades_cd;
	
	public int getFinal_score() {
		return final_score;
	}
	public void setFinal_score(int final_score) {
		this.final_score = final_score;
	}
	public String getGrades_cd() {
		return grades_cd;
	}
	public void setGrades_cd(String grades_cd) {
		this.grades_cd = grades_cd;
	}
	public Date getGraduate_date() {
		return graduate_date;
	}
	public void setGraduate_date(Date graduate_date) {
		this.graduate_date = graduate_date;
	}
	public String getPostpone() {
		return postpone;
	}
	public void setPostpone(String postpone) {
		this.postpone = postpone;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAccount_no() {
		return account_no;
	}
	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}
	public String getLecture_semester() {
		return lecture_semester;
	}
	public void setLecture_semester(String lecture_semester) {
		this.lecture_semester = lecture_semester;
	}
	public String getOrginal_nm() {
		return orginal_nm;
	}
	public void setOrginal_nm(String orginal_nm) {
		this.orginal_nm = orginal_nm;
	}
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}
	public String getStatus_nm() {
		return status_nm;
	}
	public void setStatus_nm(String status_nm) {
		this.status_nm = status_nm;
	}
	public String getAttach_no() {
		return attach_no;
	}
	public void setAttach_no(String attach_no) {
		this.attach_no = attach_no;
	}
	public String getStatus_cd() {
		return status_cd;
	}
	public void setStatus_cd(String status_cd) {
		this.status_cd = status_cd;
	}

	
	
	public String getClass_grade() {
		return class_grade;
	}
	public void setClass_grade(String class_grade) {
		this.class_grade = class_grade;
	}
	public String getClass_no() {
		return class_no;
	}
	public void setClass_no(String class_no) {
		this.class_no = class_no;
	}
	public String getStudent_no() {
		return student_no;
	}
	public void setStudent_no(String student_no) {
		this.student_no = student_no;
	}
	public String getClass_type() {
		return class_type;
	}
	public void setClass_type(String class_type) {
		this.class_type = class_type;
	}
	public int getGp() {
		return gp;
	}
	public void setGp(int gp) {
		this.gp = gp;
	}
	public int getGs() {
		return gs;
	}
	public void setGs(int gs) {
		this.gs = gs;
	}
	public int getJp() {
		return jp;
	}
	public void setJp(int jp) {
		this.jp = jp;
	}
	public int getJs() {
		return js;
	}
	public void setJs(int js) {
		this.js = js;
	}
	
	
	
}
