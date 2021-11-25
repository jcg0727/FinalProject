package kr.ac.hs.command.sugang;

import kr.ac.hs.command.SearchCriteria;

public class SugangApplyCommand  extends SearchCriteria {
	
	private String searchDept;
	private String searchYear;
	private String searchClassType;
	private String searchClassName;
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
	public String getSearchDept() {
		return searchDept;
	}
	public void setSearchDept(String searchDept) {
		this.searchDept = searchDept;
	}
	public String getSearchYear() {
		return searchYear;
	}
	public void setSearchYear(String searchYear) {
		this.searchYear = searchYear;
	}
	public String getSearchClassType() {
		return searchClassType;
	}
	public void setSearchClassType(String searchClassType) {
		this.searchClassType = searchClassType;
	}
	public String getSearchClassName() {
		return searchClassName;
	}
	public void setSearchClassName(String searchClassName) {
		this.searchClassName = searchClassName;
	}


}
