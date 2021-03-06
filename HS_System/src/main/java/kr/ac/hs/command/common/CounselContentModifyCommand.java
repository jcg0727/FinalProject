package kr.ac.hs.command.common;

import kr.ac.hs.dto.common.Counsel2VO;

public class CounselContentModifyCommand {
	
	private String counsel_no;
	private String counsel_content;
	private String status_cd;
	
	
	public String getStatus_cd() {
		return status_cd;
	}
	public void setStatus_cd(String status_cd) {
		this.status_cd = status_cd;
	}
	public String getCounsel_no() {
		return counsel_no;
	}
	public void setCounsel_no(String counsel_no) {
		this.counsel_no = counsel_no;
	}
	public String getCounsel_content() {
		return counsel_content;
	}
	public void setCounsel_content(String counsel_content) {
		this.counsel_content = counsel_content;
	}
	
	public Counsel2VO toCounsel2VO() {
		Counsel2VO counsel2vo = new Counsel2VO();
		counsel2vo.setCounsel_content(counsel_content);
		counsel2vo.setCounsel_no(counsel_no);
		counsel2vo.setStatus_cd(status_cd);
		return counsel2vo;
	}
}
