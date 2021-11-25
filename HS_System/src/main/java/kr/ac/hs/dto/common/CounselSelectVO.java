package kr.ac.hs.dto.common;

import java.util.Date;

public class CounselSelectVO {
	private String counsel_no;
	private String register_content;
	private String refuse_content;
	private String status_cd;
	private String consl_categ_cd;
	private String student_no;
	private String pro_no;
	private String counsel_date;
	private String consel_content;
	private String consl_categ_nm;
	private String attach_no;
	
	
	protected String getAttach_no() {
		return attach_no;
	}
	protected void setAttach_no(String attach_no) {
		this.attach_no = attach_no;
	}
	public String getCounsel_no() {
		return counsel_no;
	}
	public void setCounsel_no(String counsel_no) {
		this.counsel_no = counsel_no;
	}
	public String getRegister_content() {
		return register_content;
	}
	public void setRegister_content(String register_content) {
		this.register_content = register_content;
	}
	public String getRefuse_content() {
		return refuse_content;
	}
	public void setRefuse_content(String refuse_content) {
		this.refuse_content = refuse_content;
	}
	public String getStatus_cd() {
		return status_cd;
	}
	public void setStatus_cd(String status_cd) {
		this.status_cd = status_cd;
	}
	public String getConsl_categ_cd() {
		return consl_categ_cd;
	}
	public void setConsl_categ_cd(String consl_categ_cd) {
		this.consl_categ_cd = consl_categ_cd;
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
	public String getCounsel_date() {
		return counsel_date;
	}
	public void setCounsel_date(String counsel_date) {
		this.counsel_date = counsel_date;
	}
	public String getConsel_content() {
		return consel_content;
	}
	public void setConsel_content(String consel_content) {
		this.consel_content = consel_content;
	}
	public String getConsl_categ_nm() {
		return consl_categ_nm;
	}
	public void setConsl_categ_nm(String consl_categ_nm) {
		this.consl_categ_nm = consl_categ_nm;
	}
	
}
