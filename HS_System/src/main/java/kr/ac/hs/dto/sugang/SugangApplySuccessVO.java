package kr.ac.hs.dto.sugang;

public class SugangApplySuccessVO {
	
	private String class_name;
	private String class_day;
	private String apply_situation;
	private String class_no;
	private int class_grade;

	
	public int getClass_grade() {
		return class_grade;
	}
	public void setClass_grade(int class_grade) {
		this.class_grade = class_grade;
	}
	public String getClass_no() {
		return class_no;
	}
	public void setClass_no(String class_no) {
		this.class_no = class_no;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getClass_day() {
		return class_day;
	}
	public void setClass_day(String class_day) {
		this.class_day = class_day;
	}
	public String getApply_situation() {
		return apply_situation;
	}
	public void setApply_situation(String apply_situation) {
		this.apply_situation = apply_situation;
	}
}
