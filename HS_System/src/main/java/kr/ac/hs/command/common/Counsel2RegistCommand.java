package kr.ac.hs.command.common;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import kr.ac.hs.dto.common.Counsel2VO;

public class Counsel2RegistCommand {

	private String regist_title;
	private String consl_categ_nm;
	private String register_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date date1;
	private String time1;

	public String getRegist_title() {
		return regist_title;
	}

	public void setRegist_title(String regist_title) {
		this.regist_title = regist_title;
	}

	public String getConsl_categ_nm() {
		return consl_categ_nm;
	}

	public void setConsl_categ_nm(String consl_categ_nm) {
		this.consl_categ_nm = consl_categ_nm;
	}

	public String getRegister_content() {
		return register_content;
	}

	public void setRegister_content(String register_content) {
		this.register_content = register_content;
	}

	

	public Date getDate1() {
		return date1;
	}

	public void setDate1(Date date1) {
		this.date1 = date1;
	}

	public String getTime1() {
		return time1;
	}

	public void setTime1(String time1) {
		this.time1 = time1;
	}

	public Counsel2VO toVo() throws Exception {
		Counsel2VO vo = new Counsel2VO();
		vo.setRegist_title(regist_title);
		vo.setConsl_categ_nm(consl_categ_nm);
		vo.setRegister_content(register_content);
		vo.setDate1(date1);
//		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
//		Date to = fm.parse(date1);
		vo.setTime1(time1);
		return vo;
	}

}
