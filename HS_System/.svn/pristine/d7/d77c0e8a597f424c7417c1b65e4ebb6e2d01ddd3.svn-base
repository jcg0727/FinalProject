package kr.ac.hs.command.academic;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.thoughtworks.qdox.parser.ParseException;

import kr.ac.hs.dto.AcademicStateVO;

public class AcademicStateLeaveCommand {

	private String student_no;
	private String register_date;
	private String leave_type_status_cd;
	private String leave_semester;
	private String leave_start_date;
	private String leave_end_date;
	private String leave_reason;
	private String[] ex_file;
	
	

	public AcademicStateVO toVO() throws ParseException, java.text.ParseException {
		AcademicStateVO vo = new AcademicStateVO();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			
			Date parse_leave_start_date = format.parse(leave_start_date);
			Date parse_leave_end_date = format.parse(leave_end_date);
			
			vo.setStart_date(parse_leave_start_date);
			vo.setEnd_date(parse_leave_end_date);
			
	
		if (leave_type_status_cd.equals("일반휴학"))
			leave_type_status_cd = "CCDB001";
		if (leave_type_status_cd.equals("군휴학"))
			leave_type_status_cd = "CCDB002";
		if (leave_type_status_cd.equals("질병휴학"))
			leave_type_status_cd = "CCDB003";

		vo.setStudent_no(student_no);
		vo.setA_status_cd(leave_type_status_cd);
		vo.setRegister_semester(leave_semester);
		vo.setRegister_reason(leave_reason);

		return vo;
	}
	

	public String[] getEx_file() {
		return ex_file;
	}

	public void setEx_file(String[] ex_file) {
		this.ex_file = ex_file;
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

	public String getLeave_type_status_cd() {
		return leave_type_status_cd;
	}

	public void setLeave_type_status_cd(String leave_type_status_cd) {
		this.leave_type_status_cd = leave_type_status_cd;
	}

	public String getLeave_semester() {
		return leave_semester;
	}

	public void setLeave_semester(String leave_semester) {
		this.leave_semester = leave_semester;
	}

	public String getLeave_start_date() {
		return leave_start_date;
	}

	public void setLeave_start_date(String leave_start_date) {
		this.leave_start_date = leave_start_date;
	}

	public String getLeave_end_date() {
		return leave_end_date;
	}

	public void setLeave_end_date(String leave_end_date) {
		this.leave_end_date = leave_end_date;
	}

	public String getLeave_reason() {
		return leave_reason;
	}

	public void setLeave_reason(String leave_reason) {
		this.leave_reason = leave_reason;
	}

	

}
