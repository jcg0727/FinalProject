package kr.ac.hs.dto.academic;

import java.util.Date;

import kr.ac.hs.dto.AccountVO;

public class StudentVO extends AccountVO {
	private String student_no; // 학번
	private String status_cd; // 상태코드번호
	private String applicant_no; // 지원자번호
	private String dept_cd; // 학과코드
	private String plural_majordept_cd; // 복수전공학과코드
	private String account_no; // 계정번호
	private String faculty_code; // 학부코드
	private String dept_nm; // 학과명
	private String name; // 이름
	private String email;
	private String address;
	private String detail_add;
	private String phone;
	private Date registdate;
	private String pro_no;
	private String gender;

	private int finalCount;

	private int rnum;
	private int totalcnt;

	public int getFinalCount() {
		return finalCount;
	}

	public void setFinalCount(int finalCount) {
		this.finalCount = finalCount;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getTotalcnt() {
		return totalcnt;
	}

	public void setTotalcnt(int totalcnt) {
		this.totalcnt = totalcnt;
	}

	public String getDept_nm() {
		return dept_nm;
	}

	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public Date getRegistdate() {
		return registdate;
	}

	public void setRegistdate(Date registdate) {
		this.registdate = registdate;
	}

	public String getPro_no() {
		return pro_no;
	}

	public void setPro_no(String pro_no) {
		this.pro_no = pro_no;
	}

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

	public String getApplicant_no() {
		return applicant_no;
	}

	public void setApplicant_no(String applicant_no) {
		this.applicant_no = applicant_no;
	}

	public String getDept_cd() {
		return dept_cd;
	}

	public void setDept_cd(String dept_cd) {
		this.dept_cd = dept_cd;
	}

	public String getPlural_majordept_cd() {
		return plural_majordept_cd;
	}

	public void setPlural_majordept_cd(String plural_majordept_cd) {
		this.plural_majordept_cd = plural_majordept_cd;
	}

	public String getAccount_no() {
		return account_no;
	}

	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}

	public String getFaculty_code() {
		return faculty_code;
	}

	public void setFaculty_code(String faculty_code) {
		this.faculty_code = faculty_code;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

}
