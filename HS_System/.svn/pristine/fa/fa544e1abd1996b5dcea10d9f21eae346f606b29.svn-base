package kr.ac.hs.command.grades;

import java.util.HashMap;
import java.util.Map;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.grades.GradesVO;

public class RegistGradesCommand extends SearchCriteria {
	private String class_no;
	private String lecture_semester;
	private String class_name;
	private String studentNo;

	private double attendScore;
	private double middleScore;
	private double finalScore;
	private String gradesCd;

	public double getAttendScore() {
		return attendScore;
	}

	public void setAttendScore(double attendScore) {
		this.attendScore = attendScore;
	}

	public double getMiddleScore() {
		return middleScore;
	}

	public void setMiddleScore(double middleScore) {
		this.middleScore = middleScore;
	}

	public double getFinalScore() {
		return finalScore;
	}

	public void setFinalScore(double finalScore) {
		this.finalScore = finalScore;
	}

	public String getGradesCd() {
		return gradesCd;
	}

	public void setGradesCd(String gradesCd) {
		this.gradesCd = gradesCd;
	}

	public String getStudentNo() {
		return studentNo;
	}

	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
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

	public Map<String, Object> convertGradesVOWithCriteria(RegistGradesCommand cmd) {
		Map<String, Object> dataMap = new HashMap<>();

		GradesVO grades = new GradesVO();

		grades.setClass_no(class_no);
		grades.setLecture_semester(lecture_semester);
		grades.setClass_name(class_name);

		dataMap.put("grades", grades);
		dataMap.put("cri", cmd);
		return dataMap;
	}

	public GradesVO convertGradesVO() {
		GradesVO grades = new GradesVO();

		grades.setStudent_no(studentNo);
		grades.setLecture_semester(lecture_semester);
		grades.setClass_no(class_no);
		grades.setAttend_score(attendScore);
		grades.setMiddle_score(middleScore);
		grades.setFinal_score(finalScore);
		grades.setGrades_cd(gradesCd);
		
		return grades;
	}
	
	public GradesVO convertGradesVOForProf() {
		GradesVO grades = new GradesVO();
		grades.setStudent_no(studentNo);
		grades.setLecture_semester(lecture_semester);
		grades.setClass_no(class_no);
		
		return grades;
	}
}
