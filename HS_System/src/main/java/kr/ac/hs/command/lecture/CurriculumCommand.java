package kr.ac.hs.command.lecture;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.lecture.CurriculumVO;

public class CurriculumCommand extends SearchCriteria {
	private String class_no;
	private String dept_cd;
	private String dept_nm;
	private String class_nm;
	private String class_score;
	private String curri_content;
	private String delete_whether;
	private String grade;
	private String lecture_semester;
	private String class_type_cd;
	private String status_cd;

	public CurriculumVO toVO() throws Exception{
		CurriculumVO curriculumVO = new CurriculumVO();
		curriculumVO.setClass_no(class_no);
		curriculumVO.setDept_nm(dept_nm);
		curriculumVO.setClass_nm(class_nm);
		curriculumVO.setClass_score(class_score);
		curriculumVO.setCurri_content(curri_content);
		curriculumVO.setGrade(grade);
		curriculumVO.setClass_type_cd(class_type_cd);
		
		return curriculumVO;
	}
	
	
	public String getDept_nm() {
		return dept_nm;
	}

	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}

	public String getClass_no() {
		return class_no;
	}

	public void setClass_no(String class_no) {
		this.class_no = class_no;
	}

	public String getDept_cd() {
		return dept_cd;
	}

	public void setDept_cd(String dept_cd) {
		this.dept_cd = dept_cd;
	}

	public String getClass_nm() {
		return class_nm;
	}

	public void setClass_nm(String class_nm) {
		this.class_nm = class_nm;
	}

	public String getClass_score() {
		return class_score;
	}

	public void setClass_score(String class_score) {
		this.class_score = class_score;
	}

	public String getCurri_content() {
		return curri_content;
	}

	public void setCurri_content(String curri_content) {
		this.curri_content = curri_content;
	}

	public String getDelete_whether() {
		return delete_whether;
	}

	public void setDelete_whether(String delete_whether) {
		this.delete_whether = delete_whether;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getLecture_semester() {
		return lecture_semester;
	}

	public void setLecture_semester(String lecture_semester) {
		this.lecture_semester = lecture_semester;
	}

	public String getClass_type_cd() {
		return class_type_cd;
	}

	public void setClass_type_cd(String class_type_cd) {
		this.class_type_cd = class_type_cd;
	}

	public String getStatus_cd() {
		return status_cd;
	}

	public void setStatus_cd(String status_cd) {
		this.status_cd = status_cd;
	}

}
