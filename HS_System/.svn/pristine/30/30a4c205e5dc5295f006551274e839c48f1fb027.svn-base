package kr.ac.hs.command.academic;

import org.apache.velocity.exception.ParseErrorException;

import kr.ac.hs.dto.AcademicStateVO;

public class AcademicDropCommand {

	private String student_no;
	private String drop_reason;
	private String r_status_cd;

	public String getStudent_no() {
		return student_no;
	}

	public void setStudent_no(String student_no) {
		this.student_no = student_no;
	}

	public String getDrop_reason() {
		return drop_reason;
	}

	public void setDrop_reason(String drop_reason) {
		this.drop_reason = drop_reason;
	}

	public String getR_status_cd() {
		return r_status_cd;
	}

	public void setR_status_cd(String r_status_cd) {
		this.r_status_cd = r_status_cd;
	}

	public AcademicStateVO toVO() throws ParseErrorException {
		AcademicStateVO vo = new AcademicStateVO();

		vo.setStudent_no(student_no);
		vo.setRegister_reason(drop_reason);
		vo.setR_status_cd(r_status_cd);
		return vo;

	}

}
