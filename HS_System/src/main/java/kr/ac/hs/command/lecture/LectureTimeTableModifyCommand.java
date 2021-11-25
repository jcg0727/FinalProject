package kr.ac.hs.command.lecture;

import kr.ac.hs.dto.lecture.LectureTimeVO;

public class LectureTimeTableModifyCommand {
	private String day;
	private String period;
	private String end_period;
	private String class_no;
	private String lecture_semester;
	
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getEnd_period() {
		return end_period;
	}
	public void setEnd_period(String end_period) {
		this.end_period = end_period;
	}
	public String getClass_no() {
		return class_no;
	}
	public void setClass_no(String class_no) {
		this.class_no = class_no;
	}
	public String getLecture_semester() {
		return lecture_semester;
	}
	public void setLecture_semester(String lecture_semester) {
		this.lecture_semester = lecture_semester;
	}
	
	public LectureTimeVO toLectureTime(){
		LectureTimeVO lectureTime = new LectureTimeVO();
		lectureTime.setDay(day);
		lectureTime.setPeriod(period);
		lectureTime.setEnd_period(end_period);
		lectureTime.setLecture_semester(lecture_semester);
		lectureTime.setClass_no(class_no);
		return lectureTime;
	}
}
