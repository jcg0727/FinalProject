package kr.ac.hs.command.scholar;

import kr.ac.hs.dto.scholar.ScholarStaffVO;

public class ScholarCommand {

	private String student_no;
	private String scholar_amount;
	private String grade;
	private String status_cd;
	private String recommend_date;
	private String semester;
	
	public ScholarStaffVO toUpdateStaff() throws Exception{
		ScholarStaffVO vo = new ScholarStaffVO();
		
		vo.setScholar_amount(scholar_amount);
		vo.setStudent_no(student_no);
		vo.setRecommend_date(recommend_date);
		vo.setSemester(semester);

		return vo;
	}
	
	public ScholarStaffVO toDelete() throws Exception{
		ScholarStaffVO vo = new ScholarStaffVO();
		
		vo.setStudent_no(student_no);
		vo.setRecommend_date(recommend_date);
	
		return vo;
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

	public String getRecommend_date() {
		return recommend_date;
	}

	public void setRecommend_date(String recommend_date) {
		this.recommend_date = recommend_date;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}
	
	
}
