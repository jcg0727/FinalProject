package kr.ac.hs.dto.applicant;

import java.util.Date;

public class StaffApplicantVO {
	
	private String no;
	private String applicant_no; //수험번호
	private String student_no;
	private String picture;
	private String name;
	private String reg_no;     	 //주민번호
	private String email;
	private String address;
	private String detail_add;
	private String phone;
	private String pass_whether; //합격여부
	private String regist_check; //등록금납부여부
	private String appli_dept;   //지원학과
	private String dept_cd;
	private String dept_nm; 	 //지원학과명
	private Date registdate;     //지원일자
	private String faculty_code; // 학부코드
	private String account_no;
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getApplicant_no() {
		return applicant_no;
	}
	public void setApplicant_no(String applicant_no) {
		this.applicant_no = applicant_no;
	}
	public String getStudent_no() {
		return student_no;
	}
	public void setStudent_no(String student_no) {
		this.student_no = student_no;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getReg_no() {
		return reg_no;
	}
	public void setReg_no(String reg_no) {
		this.reg_no = reg_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetail_add() {
		return detail_add;
	}
	public void setDetail_add(String detail_add) {
		this.detail_add = detail_add;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPass_whether() {
		return pass_whether;
	}
	public void setPass_whether(String pass_whether) {
		this.pass_whether = pass_whether;
	}
	public String getRegist_check() {
		return regist_check;
	}
	public void setRegist_check(String regist_check) {
		this.regist_check = regist_check;
	}
	public String getAppli_dept() {
		return appli_dept;
	}
	public void setAppli_dept(String appli_dept) {
		this.appli_dept = appli_dept;
	}
	public String getDept_cd() {
		return dept_cd;
	}
	public void setDept_cd(String dept_cd) {
		this.dept_cd = dept_cd;
	}
	public String getDept_nm() {
		return dept_nm;
	}
	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}
	public Date getRegistdate() {
		return registdate;
	}
	public void setRegistdate(Date registdate) {
		this.registdate = registdate;
	}
	public String getFaculty_code() {
		return faculty_code;
	}
	public void setFaculty_code(String faculty_code) {
		this.faculty_code = faculty_code;
	}
	public String getAccount_no() {
		return account_no;
	}
	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}  
	
	
	
}
