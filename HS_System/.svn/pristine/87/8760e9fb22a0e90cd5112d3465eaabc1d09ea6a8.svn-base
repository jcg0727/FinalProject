package kr.ac.hs.command.scholar;

import kr.ac.hs.dto.tuition.TuitionVO;

public class TuitionrCommand {

	private String student_no;
	private String semester;
	private String scholar_amount;
	private String payment_amount;
	
	public TuitionVO toDetailTuition() throws Exception{
		TuitionVO vo = new TuitionVO();
		
		vo.setStudent_no(student_no);
		vo.setSemester(semester);

		return vo;
	}

	public TuitionVO toPayment() throws Exception{
		TuitionVO vo = new TuitionVO();
		
		vo.setStudent_no(student_no);
		vo.setSemester(semester);
		vo.setPayment_amount(payment_amount);
		
		return vo;
	}

	public String getStudent_no() {
		return student_no;
	}

	public void setStudent_no(String student_no) {
		this.student_no = student_no;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public String getScholar_amount() {
		return scholar_amount;
	}

	public void setScholar_amount(String scholar_amount) {
		this.scholar_amount = scholar_amount;
	}

	public String getPayment_amount() {
		return payment_amount;
	}

	public void setPayment_amount(String payment_amount) {
		this.payment_amount = payment_amount;
	}
	
	
}
