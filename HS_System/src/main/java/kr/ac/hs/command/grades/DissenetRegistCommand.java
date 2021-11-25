package kr.ac.hs.command.grades;

import javax.servlet.http.HttpSession;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.academic.StudentVO;
import kr.ac.hs.dto.grades.GradesDissentVO;

public class DissenetRegistCommand extends SearchCriteria {

	private String dissentGradesNo;
	private String guide;
	private String register_reason;
	private String statusCd;
	private String student_no;
	private String lecture_semester;
	private String class_no;
	private String class_type;
	private String grades_cd;

	private String class_name;
	private String pro_name;

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

	public String getDissentGradesNo() {
		return dissentGradesNo;
	}

	public void setDissentGradesNo(String dissentGradesNo) {
		this.dissentGradesNo = dissentGradesNo;
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

	public String getStatusCd() {
		return statusCd;
	}

	public void setStatusCd(String statusCd) {
		this.statusCd = statusCd;
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

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public GradesDissentVO convertGradesDissent(HttpSession session) {
		StudentVO student = (StudentVO) session.getAttribute("loginUser");

		GradesDissentVO dissent = new GradesDissentVO();
		dissent.setRegister_reason(register_reason);
		dissent.setClass_no(class_no);
		dissent.setStudent_no(student.getStudent_no());
		dissent.setStatus_cd("CCDY003");
		dissent.setLecture_semester(lecture_semester);

		return dissent;
	}

	public GradesDissentVO convertGradesDissentFromProf() {

		GradesDissentVO dissent = new GradesDissentVO();

		dissent.setRegister_reason(register_reason);
		dissent.setClass_no(class_no);
		dissent.setStudent_no(student_no);
		dissent.setStatus_cd("CCDY003");
		dissent.setLecture_semester(lecture_semester);

		return dissent;
	}

	public GradesDissentVO convertGradesDissentFromProfByUpdate() {

		GradesDissentVO dissent = new GradesDissentVO();

		dissent.setDissent_grades_no(dissentGradesNo);
		dissent.setStatus_cd(statusCd);
		dissent.setGuide(guide);
		
		return dissent;
	}

}
