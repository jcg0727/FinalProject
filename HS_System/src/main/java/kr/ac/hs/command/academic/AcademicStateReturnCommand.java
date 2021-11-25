package kr.ac.hs.command.academic;

import kr.ac.hs.dto.academic.AcademicStateStaffVO;

public class AcademicStateReturnCommand {

	private String student_no;
	private String register_date;
	private String a_status_cd;
	private String r_status_cd;
	private String register_reason;

	public AcademicStateStaffVO toVO() throws Exception {
		AcademicStateStaffVO vo = new AcademicStateStaffVO();

		vo.setStudent_no(student_no);
		vo.setRegister_date(register_date);
		vo.setR_status_cd(r_status_cd);

		return vo;

	}

	public AcademicStateStaffVO toStudentVO() throws Exception {
		AcademicStateStaffVO vo = new AcademicStateStaffVO();

		vo.setStudent_no(student_no);
		vo.setA_status_cd(a_status_cd);
		vo.setRegister_reason(register_reason);

		return vo;

	}

	public String getStudent_no() {
		return student_no;
	}

	public void setStudent_no(String student_no) {
		this.student_no = student_no;
	}

	public String getRegister_date() {
		return register_date;
	}

	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}

	public String getA_status_cd() {
		return a_status_cd;
	}

	public void setA_status_cd(String a_status_cd) {
		this.a_status_cd = a_status_cd;
	}

	public String getR_status_cd() {
		return r_status_cd;
	}

	public void setR_status_cd(String r_status_cd) {
		this.r_status_cd = r_status_cd;
	}

	public String getRegister_reason() {
		return register_reason;
	}

	public void setRegister_reason(String register_reason) {
		this.register_reason = register_reason;
	}

}
