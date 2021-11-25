package kr.ac.hs.command.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import kr.ac.hs.dto.common.CounselVO;

public class CounselRegistCommand {

	private String pro_no;
	private String student_no;
	private String counsel_date;
	private String register_date;
	private SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm");

	public String getRegister_date() {
		return register_date;
	}

	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}

	public SimpleDateFormat getFormat() {
		return format;
	}

	public void setFormat(SimpleDateFormat format) {
		this.format = format;
	}

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

	public String getCounsel_date() {
		return counsel_date;
	}

	public void setCounsel_date(String counsel_date) {
		this.counsel_date = counsel_date;
	}

	public CounselVO toVo() throws ParseException {
		CounselVO counsel = new CounselVO();

		counsel.setPro_no(pro_no);
		counsel.setStudent_no(student_no);

		counsel_date = counsel_date.replace("-", "/");
		Date parseDate = format.parse(counsel_date);
		
		counsel.setCounsel_date(parseDate);

		return counsel;
	}

}
