package kr.ac.hs.command.academic;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import kr.ac.hs.dto.academic.PluralMajorVO;

public class PluralRegistCommand {
	private String student_no;
	private String status_cd;
	private String apply_deptnm;
	private String transfer_counsel;
	private String register_date;
	private String register_reason;
	private String dept_nm;
	
	
	
	public String getDept_nm() {
		return dept_nm;
	}

	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}

	public String getRegister_reason() {
		return register_reason;
	}

	public void setRegister_reason(String register_reason) {
		this.register_reason = register_reason;
	}
	SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm");

	public String getStudent_no() {
		return student_no;
	}

	public void setStudent_no(String student_no) {
		this.student_no = student_no;
	}

	public String getStatus_cd() {
		return status_cd;
	}

	public void setStatus_cd(String status_cd) {
		this.status_cd = status_cd;
	}

	public String getApply_deptnm() {
		return apply_deptnm;
	}

	public void setApply_deptnm(String apply_deptnm) {
		this.apply_deptnm = apply_deptnm;
	}

	public String getTransfer_counsel() {
		return transfer_counsel;
	}

	public void setTransfer_counsel(String transfer_counsel) {
		this.transfer_counsel = transfer_counsel;
	}

	public String getRegister_date() {
		return register_date;
	}

	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}

	public SimpleDateFormat getFormat() {
		return format;
	}

	public void setFormat(SimpleDateFormat format) {
		this.format = format;
	}
	
	public PluralMajorVO toVO() {
		PluralMajorVO vo = new PluralMajorVO();
		vo.setStudent_no(student_no);
		vo.setStatus_cd(status_cd);
		vo.setApply_deptnm(apply_deptnm);
		vo.setDept_nm(dept_nm);
		if(register_date != null) {
			try {
				Date parse = format.parse(register_date);
				vo.setRegister_date(parse);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(this.transfer_counsel != null) {
			this.transfer_counsel = transfer_counsel.replace("-", "/");
		}
		return vo;
	}
	public Date formatDate() throws ParseException{
		this.transfer_counsel = transfer_counsel.replace("-", "/");
		Date date = format.parse(transfer_counsel);
		return date; 
	}
	
}
