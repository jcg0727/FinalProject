package kr.ac.hs.command.grades;

import javax.servlet.http.HttpSession;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.AccountVO;
import kr.ac.hs.dto.grades.GradesVO;

public class scoreCommand extends SearchCriteria {
	private String lecture_semester;

	public String getLecture_semester() {
		return lecture_semester;
	}

	public void setLecture_semester(String lecture_semester) {
		this.lecture_semester = lecture_semester;
	}

	public GradesVO convertGradesVO(HttpSession session) {
		GradesVO grades = new GradesVO();
		
		AccountVO account = (AccountVO) session.getAttribute("loginUser");
		
		grades.setLecture_semester(lecture_semester);
		grades.setStudent_no(account.getStudent_no());
		
		return grades;
	}
}
