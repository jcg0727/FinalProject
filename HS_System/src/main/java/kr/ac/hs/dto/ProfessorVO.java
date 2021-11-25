package kr.ac.hs.dto;

import java.util.Date;

public class ProfessorVO extends AccountVO {
	private String pro_no; //교수사번
	private Date recrument_date; //채용일자
	private String dept_cd; //학과코드
	private String account_no; //계정번호
	private String pro_name;
	private String student_no;

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public String getStudent_no() {
		return student_no;
	}

	public void setStudent_no(String student_no) {
		this.student_no = student_no;
	}

	public String getPro_no() {
		return pro_no;
	}

	public void setPro_no(String pro_no) {
		this.pro_no = pro_no;
	}

	public Date getRecrument_date() {
		return recrument_date;
	}

	public void setRecrument_date(Date recrument_date) {
		this.recrument_date = recrument_date;
	}

	public String getDept_cd() {
		return dept_cd;
	}

	public void setDept_cd(String dept_cd) {
		this.dept_cd = dept_cd;
	}

	public String getAccount_no() {
		return account_no;
	}

	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}

}
