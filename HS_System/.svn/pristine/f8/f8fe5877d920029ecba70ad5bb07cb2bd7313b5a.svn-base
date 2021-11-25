package kr.ac.hs.command.applicant;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.applicant.StaffApplicantVO;

public class StaffApplicantCommand extends SearchCriteria {
	
	private String dept_nm;
	private String applicant_no;
	private String pass_whether;
	private String regist_check;
	private String name;
	private String picture;
	private String reg_no;
	private String email;
	private String phone;
	private String dept_cd;
	private String faculity_code;
	private String account_no;
	
	
	public StaffApplicantVO toVO() throws Exception{
		StaffApplicantVO staffApplicantVO = new StaffApplicantVO();
		
		staffApplicantVO.setApplicant_no(applicant_no);
		staffApplicantVO.setPass_whether(pass_whether);
		
		return staffApplicantVO;
	}

/*	public StaffApplicantVO toInsertAccountVO() throws Exception{
		StaffApplicantVO staffApplicantVO = new StaffApplicantVO();
		
		staffApplicantVO.setPicture(picture);
		staffApplicantVO.setName(name);
		staffApplicantVO.setReg_no(reg_no);
		staffApplicantVO.setEmail(email);
		staffApplicantVO.setPhone(phone);
		
		return staffApplicantVO;
	}*/
	
	public StaffApplicantVO toInsertStudentVO() throws Exception{
		StaffApplicantVO staffApplicantVO = new StaffApplicantVO();

		staffApplicantVO.setAccount_no(account_no);
		staffApplicantVO.setApplicant_no(applicant_no);
		staffApplicantVO.setPicture(picture);
		staffApplicantVO.setName(name);
		staffApplicantVO.setReg_no(reg_no);
		staffApplicantVO.setEmail(email);
		staffApplicantVO.setPhone(phone);
	//	staffApplicantVO.setDept_cd(dept_cd);
		
		return staffApplicantVO;
	}
	
	
	public String getAccount_no() {
		return account_no;
	}
	
	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}
	
	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDept_cd() {
		return dept_cd;
	}

	public void setDept_cd(String dept_cd) {
		this.dept_cd = dept_cd;
	}

	public String getFaculity_code() {
		return faculity_code;
	}

	public void setFaculity_code(String faculity_code) {
		this.faculity_code = faculity_code;
	}

	public String getDept_nm() {
		return dept_nm;
	}
	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}
	public String getApplicant_no() {
		return applicant_no;
	}
	public void setApplicant_no(String applicant_no) {
		this.applicant_no = applicant_no;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
	
}
