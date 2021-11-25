package kr.ac.hs.dto;

public class DepartmentVO {
	private String dept_cd;
	private String faculty_cd;
	private String faculty_nm;
	private String dept_nm;
	private int personnel;
	private int major_required;
	private int major_select;
	private int liberal_arts_required;
	private int liberal_arts_select;
	private int totalcnt;

	public String getDept_cd() {
		return dept_cd;
	}

	public void setDept_cd(String dept_cd) {
		this.dept_cd = dept_cd;
	}

	public String getFaculty_cd() {
		return faculty_cd;
	}

	public void setFaculty_cd(String faculty_cd) {
		this.faculty_cd = faculty_cd;
	}

	public String getFaculty_nm() {
		return faculty_nm;
	}

	public void setFaculty_nm(String faculty_nm) {
		this.faculty_nm = faculty_nm;
	}

	public String getDept_nm() {
		return dept_nm;
	}

	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}

	public int getPersonnel() {
		return personnel;
	}

	public void setPersonnel(int personnel) {
		this.personnel = personnel;
	}

	public int getMajor_required() {
		return major_required;
	}

	public void setMajor_required(int major_required) {
		this.major_required = major_required;
	}

	public int getMajor_select() {
		return major_select;
	}

	public void setMajor_select(int major_select) {
		this.major_select = major_select;
	}

	public int getLiberal_arts_required() {
		return liberal_arts_required;
	}

	public void setLiberal_arts_required(int liberal_arts_required) {
		this.liberal_arts_required = liberal_arts_required;
	}

	public int getLiberal_arts_select() {
		return liberal_arts_select;
	}

	public void setLiberal_arts_select(int liberal_arts_select) {
		this.liberal_arts_select = liberal_arts_select;
	}

	public int getTotalcnt() {
		return totalcnt;
	}

	public void setTotalcnt(int totalcnt) {
		this.totalcnt = totalcnt;
	}
	

}
