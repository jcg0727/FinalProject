package kr.ac.hs.command.attendance;

public class AttendanceCommand {
	
	private String attend_no; 		//출석번호
	private String attend_date; 	//출석일시
	private String tardy; 			//지각여부 
	private String lecture_semester; //개설강의학기 
	private String class_no; 		//학수번호
	private String student_no; 		//학번
	
	private String studentNo_check;  //체크용 학번 (파이썬)
	private String id_check;  //체크용 학번(파이썬)
	private String classNo_check;		//학수번호
	private String result;
	
	public String getAttend_no() {
		return attend_no;
	}
	public void setAttend_no(String attend_no) {
		this.attend_no = attend_no;
	}
	public String getAttend_date() {
		return attend_date;
	}
	public void setAttend_date(String attend_date) {
		this.attend_date = attend_date;
	}
	public String getTardy() {
		return tardy;
	}
	public void setTardy(String tardy) {
		this.tardy = tardy;
	}
	public String getLecture_semester() {
		return lecture_semester;
	}
	public void setLecture_semester(String lecture_semester) {
		this.lecture_semester = lecture_semester;
	}
	public String getClass_no() {
		return class_no;
	}
	public void setClass_no(String class_no) {
		this.class_no = class_no;
	}
	public String getStudent_no() {
		return student_no;
	}
	public void setStudent_no(String student_no) {
		this.student_no = student_no;
	}
	public String getStudentNo_check() {
		return studentNo_check;
	}
	public void setStudentNo_check(String studentNo_check) {
		this.studentNo_check = studentNo_check;
	}
	public String getId_check() {
		return id_check;
	}
	public void setId_check(String id_check) {
		this.id_check = id_check;
	}
	public String getClassNo_check() {
		return classNo_check;
	}
	public void setClassNo_check(String classNo_check) {
		this.classNo_check = classNo_check;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
	
	
	
	
	
	
	
	
	

}
