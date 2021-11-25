package kr.ac.hs.dto;

public class AccountVO {
	private String account_no; //계정번호
	private String pwd; //비밀번호
	private String picture; //사진
	private String name; //성명
	private String reg_no; //주민번호
	private String email; //이메일주소
	private int security_level; //보안레벨
	private String authority_cd; //권한
	private String gender;
	private String id;
	private String gubun;
	private String student_no; // 학생번호
	private String pro_no; // 교수번호
	private String staff_no; // 교직원번호
	private int length;
	
	
		
	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
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

	public String getStaff_no() {
		return staff_no;
	}

	public void setStaff_no(String staff_no) {
		this.staff_no = staff_no;
	}

	public String getAccount_no() {
		return account_no;
	}

	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
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

	public int getSecurity_level() {
		return security_level;
	}

	public void setSecurity_level(int security_level) {
		this.security_level = security_level;
	}

	public String getAuthority_cd() {
		return authority_cd;
	}

	public void setAuthority_cd(String authority_cd) {
		this.authority_cd = authority_cd;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGubun() {
		return gubun;
	}

	public void setGubun(String gubun) {
		this.gubun = gubun;
	}

}
