package kr.ac.hs.command.notice;

import kr.ac.hs.dto.notice.NoticeVO;

public class NoticeModifyCommand extends NoticeCommand {
	
	private String notice_no;
	private String[] deleteFile;
	
	public String getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(String notice_no) {
		this.notice_no = notice_no;
	}
	public String[] getDeleteFile() {
		return deleteFile;
	}
	public void setDeleteFile(String[] deleteFile) {
		this.deleteFile = deleteFile;
	}
	@Override
	public NoticeVO toVO(){
		NoticeVO notice = super.toVO();
		notice.setNotice_no(this.notice_no);
		return notice;
	}
}
