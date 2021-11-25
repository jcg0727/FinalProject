package kr.ac.hs.command.sugang;

public class ApplyExpectedLectureCommand {
	
	private String class_no;
	
	private String class_day;
	private String class_start_time;
	private String class_end_time;
	
	public String getClass_day() {
		return class_day;
	}
	public void setClass_day(String class_day) {
		this.class_day = class_day;
	}
	public String getClass_start_time() {
		return class_start_time;
	}
	public void setClass_start_time(String class_start_time) {
		this.class_start_time = class_start_time;
	}
	public String getClass_end_time() {
		return class_end_time;
	}
	public void setClass_end_time(String class_end_time) {
		this.class_end_time = class_end_time;
	}
	public String getClass_no() {
		return class_no;
	}
	public void setClass_no(String class_no) {
		this.class_no = class_no;
	}

}
