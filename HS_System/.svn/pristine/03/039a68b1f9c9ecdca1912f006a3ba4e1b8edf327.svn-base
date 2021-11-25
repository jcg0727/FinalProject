package kr.ac.hs.command.lecture;

import kr.ac.hs.dto.lecture.LectureVO;

public class LectureProfessorModifyCommand {
	private String class_no;
	private String pro_no;
	public String getClass_no() {
		return class_no;
	}
	public void setClass_no(String class_no) {
		this.class_no = class_no;
	}
	public String getPro_no() {
		return pro_no;
	}
	public void setPro_no(String pro_no) {
		this.pro_no = pro_no;
	}
	
	public LectureVO toLecture() {
		LectureVO lecturePro = new LectureVO();
		lecturePro.setPro_no(this.pro_no);
		lecturePro.setClass_no(this.class_no);
		return lecturePro;
		
		
		
	}
}
