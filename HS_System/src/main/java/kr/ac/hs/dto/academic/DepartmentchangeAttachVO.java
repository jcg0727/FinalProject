package kr.ac.hs.dto.academic;

import java.util.Date;

public class DepartmentchangeAttachVO {
	
	private String student_no;
	private Date register_date;
	private String attach_no;
	private String delete_whether;

	public String getStudent_no() {
		return student_no;
	}
	public void setStudent_no(String student_no) {
		this.student_no = student_no;
	}
	public Date getRegister_date() {
		return register_date;
	}
	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}
	public String getAttach_no() {
		return attach_no;
	}
	public void setAttach_no(String attach_no) {
		this.attach_no = attach_no;
	}
	public String getDelete_whether() {
		return delete_whether;
	}
	public void setDelete_whether(String delete_whether) {
		this.delete_whether = delete_whether;
	}

	
}
