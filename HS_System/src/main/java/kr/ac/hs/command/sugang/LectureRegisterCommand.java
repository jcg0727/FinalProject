package kr.ac.hs.command.sugang;

import kr.ac.hs.dto.sugang.LectureRegisterVO;

public class LectureRegisterCommand {
	
	private String student_no;
	private String lecture_semester;
	private String class_no;
	private String status_cd;
	private String personnel;
	private int apply_score;
	
	

	public int getApply_score() {
		return apply_score;
	}
	public void setApply_score(int apply_score) {
		this.apply_score = apply_score;
	}

	public String getPersonnel() {
		return personnel;
	}
	public void setPersonnel(String personnel) {
		this.personnel = personnel;
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
	public String getStatus_cd() {
		return status_cd;
	}
	public void setStatus_cd(String status_cd) {
		this.status_cd = status_cd;
	}
	
	public LectureRegisterVO toVO() {
		LectureRegisterVO vo = new LectureRegisterVO();
		
		vo.setStudent_no(student_no);
		vo.setClass_no(class_no);
		
		return vo;
	}
}
