
package kr.ac.hs.dto.sugang;

public class LectureListVO {
	
	private String class_no_li;		//학수번호
	private String class_name_li;	//교과목명
	private String class_grade_li;	//학점
	private String class_day_li;	//강의시간(ex_월1,2)
	private String class_apply_li;	//신청인원(ex_ 0/2)
	private String class_year_li;	//학년
	private String Class_type_li;	//이수구분

	public String getClass_no_li() {
		return class_no_li;
	}
	public void setClass_no_li(String class_no_li) {
		this.class_no_li = class_no_li;
	}
	public String getClass_name_li() {
		return class_name_li;
	}
	public void setClass_name_li(String class_name_li) {
		this.class_name_li = class_name_li;
	}
	public String getClass_grade_li() {
		return class_grade_li;
	}
	public void setClass_grade_li(String class_grade_li) {
		this.class_grade_li = class_grade_li;
	}
	public String getClass_day_li() {
		return class_day_li;
	}
	public void setClass_day_li(String class_day_li) {
		this.class_day_li = class_day_li;
	}
	public String getClass_apply_li() {
		return class_apply_li;
	}
	public void setClass_apply_li(String class_apply_li) {
		this.class_apply_li = class_apply_li;
	}
	public String getClass_year_li() {
		return class_year_li;
	}
	public void setClass_year_li(String class_year_li) {
		this.class_year_li = class_year_li;
	}
	
	public String getClass_type_li() {
		return Class_type_li;
	}
	public void setClass_type_li(String class_type_li) {
		Class_type_li = class_type_li;
	}
	
	

}
