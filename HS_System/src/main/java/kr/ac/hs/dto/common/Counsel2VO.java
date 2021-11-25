package kr.ac.hs.dto.common;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Counsel2VO {
	
	private String num;
	private String counsel_no;
	private String register_content;
	private String refuse_content;
	private String status_nm;
	private String consl_categ_cd;
	private String student_no;
	private String name;
	private Date counsel_date;
	private String counsel_content;
	private String consl_categ_nm;
	private String regist_title;
	private String status_cd;
	private String account_no;
	private String pro_no;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date date1;
	private String time1;


	
	public Date getDate1() {
		return date1;
	}
	public void setDate1(Date date1) {
		this.date1 = date1;
	}
	public String getTime1() {
		return time1;
	}
	public void setTime1(String time1) {
		this.time1 = time1;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
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
	public String getStatus_nm() {
		return status_nm;
	}
	public void setStatus_nm(String status_nm) {
		this.status_nm = status_nm;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getCounsel_date() {
		return counsel_date;
	}
	public void setCounsel_date(Date counsel_date) {
		this.counsel_date = counsel_date;
	}
	public String getCounsel_content() {
		return counsel_content;
	}
	public void setCounsel_content(String counsel_content) {
		this.counsel_content = counsel_content;
	}
	public String getConsl_categ_nm() {
		return consl_categ_nm;
	}
	public void setConsl_categ_nm(String consl_categ_nm) {
		this.consl_categ_nm = consl_categ_nm;
	}
	public String getRegist_title() {
		return regist_title;
	}
	public void setRegist_title(String regist_title) {
		this.regist_title = regist_title;
	}
	public String getStatus_cd() {
		return status_cd;
	}
	public void setStatus_cd(String status_cd) {
		this.status_cd = status_cd;
	}
	public String getAccount_no() {
		return account_no;
	}
	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}
	public String getPro_no() {
		return pro_no;
	}
	public void setPro_no(String pro_no) {
		this.pro_no = pro_no;
	}
	
	
}
