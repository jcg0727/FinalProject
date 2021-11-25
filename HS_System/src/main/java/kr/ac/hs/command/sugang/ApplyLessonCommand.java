package kr.ac.hs.command.sugang;

public class ApplyLessonCommand {
	
	private String student_no;
	private String class_no;
	private String title;
	private String class_start_day;
	private String class_end_day;
	private String pro_no;
	
	
	
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
	public String getClass_no() {
		return class_no;
	}
	public void setClass_no(String class_no) {
		this.class_no = class_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getClass_start_day() {
		return class_start_day;
	}
	public void setClass_start_day(String class_start_day) {
		this.class_start_day = class_start_day;
	}
	public String getClass_end_day() {
		return class_end_day;
	}
	public void setClass_end_day(String class_end_day) {
		this.class_end_day = class_end_day;
	}

}
