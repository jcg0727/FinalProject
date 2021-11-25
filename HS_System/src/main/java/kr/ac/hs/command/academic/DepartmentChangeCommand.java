package kr.ac.hs.command.academic;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import kr.ac.hs.dto.academic.DepartmentChangeVO;

public class DepartmentChangeCommand {
	private String student_no;
	private String register_reason;
	private String status_cd;
	private String apply_dept_nm;
	private String transfer_counsel;
	private String register_date;
	private String counsel_no;

	SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm");
	private String[] transfer_files;

	public String getCounsel_no() {
		return counsel_no;
	}

	public void setCounsel_no(String counsel_no) {
		this.counsel_no = counsel_no;
	}

	public SimpleDateFormat getFormat() {
		return format;
	}

	public void setFormat(SimpleDateFormat format) {
		this.format = format;
	}

	public String getRegister_date() {
		return register_date;
	}

	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}


	public String[] getTransfer_files() {
		return transfer_files;
	}

	public void setTransfer_files(String[] transfer_files) {
		this.transfer_files = transfer_files;
	}

	public String getStudent_no() {
		return student_no;
	}

	public void setStudent_no(String student_no) {
		this.student_no = student_no;
	}

	public String getRegister_reason() {
		return register_reason;
	}

	public void setRegister_reason(String register_reason) {
		this.register_reason = register_reason;
	}

	public String getStatus_cd() {
		return status_cd;
	}

	public void setStatus_cd(String status_cd) {
		this.status_cd = status_cd;
	}

	public String getApply_dept_nm() {
		return apply_dept_nm;
	}

	public void setApply_dept_nm(String apply_dept_nm) {
		this.apply_dept_nm = apply_dept_nm;
	}

	public String getTransfer_counsel() {
		return transfer_counsel;
	}

	public void setTransfer_counsel(String transfer_counsel) {
		this.transfer_counsel = transfer_counsel;
	}

	public DepartmentChangeVO toVO() {
		DepartmentChangeVO vo = new DepartmentChangeVO();
		vo.setStudent_no(student_no);
		vo.setRegister_reason(register_reason);
		vo.setStatus_cd(status_cd);
		
		if(register_date != null) {
			this.register_date = register_date.replace("-", "/");
			try {
				Date date = format.parse(register_date);
				vo.setRegister_date(date);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(apply_dept_nm != null) {
			vo.setApply_dept_nm(apply_dept_nm);
		}

		if (register_date != null) {
			try {
				Date parse = format.parse(register_date);
				vo.setRegister_date(parse);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (this.transfer_counsel != null) {
			this.transfer_counsel = transfer_counsel.replace("-", "/");
		}

		if (this.counsel_no != null) {
			vo.setCounsel_no(this.counsel_no);
		}
		return vo;
	}

	public Date formatDate() throws ParseException {
		this.transfer_counsel = transfer_counsel.replace("-", "/");

		Date date = format.parse(transfer_counsel);
		return date;
	}
}
