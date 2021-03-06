package kr.ac.hs.dto.scholar;

import java.util.Date;

public class ScholarVO {

	Date recommend_date;
	String student_no;
	String scholar_amount;
	String status_cd;
	String dept_nm;
	String name;
	String no;
	String grade;
	String rank;
	String grades_avg;
	String reScore;
	String year;
	String semester;
	private int rnum;
	private int totalcnt;

	public Date getRecommend_date() {
		return recommend_date;
	}

	public void setRecommend_date(Date recommend_date) {
		this.recommend_date = recommend_date;
	}

	public String getStudent_no() {
		return student_no;
	}

	public void setStudent_no(String student_no) {
		this.student_no = student_no;
	}

	public String getScholar_amount() {
		return scholar_amount;
	}

	public void setScholar_amount(String scholar_amount) {
		this.scholar_amount = scholar_amount;
	}

	public String getStatus_cd() {
		return status_cd;
	}

	public void setStatus_cd(String status_cd) {
		this.status_cd = status_cd;
	}

	public String getDept_nm() {
		return dept_nm;
	}

	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getGrades_avg() {
		return grades_avg;
	}

	public void setGrades_avg(String grades_avg) {
		this.grades_avg = grades_avg;
	}

	public String getReScore() {
		return reScore;
	}

	public void setReScore(String reScore) {
		this.reScore = reScore;
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

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

}
