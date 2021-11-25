package kr.ac.hs.command.common;

import org.apache.velocity.exception.ParseErrorException;

import kr.ac.hs.dto.DepartmentVO;

public class DepartmentCommand {
	private String dept_cd;
	private String faculty_cd;
	private String dept_nm;
	private int personnel;
	private int major_required;
	private int major_select;
	private int liberal_arts_required;
	private int liberal_arts_select;

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

	public DepartmentVO toVO() throws ParseErrorException {
		DepartmentVO vo = new DepartmentVO();

		vo.setDept_cd(dept_cd);
		vo.setDept_nm(dept_nm);
		vo.setFaculty_cd(faculty_cd);
		vo.setLiberal_arts_required(liberal_arts_required);
		vo.setLiberal_arts_select(liberal_arts_select);
		vo.setMajor_required(major_required);
		vo.setMajor_select(major_select);
		vo.setPersonnel(personnel);
		return vo;

	}

}
