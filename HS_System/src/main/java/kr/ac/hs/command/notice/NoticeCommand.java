package kr.ac.hs.command.notice;

import java.util.List;

import org.apache.velocity.exception.ParseErrorException;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.hs.dto.notice.NoticeVO;

public class NoticeCommand {

	private String title;
	private String content;
	private String importance;
	private String target;
	private MultipartFile[] uploadFile;
	
	public MultipartFile[] getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile[] uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImportance() {
		return importance;
	}
	public void setImportance(String importance) {
		this.importance = importance;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	
	public NoticeVO toVO()throws ParseErrorException{
		NoticeVO vo = new NoticeVO();
		
		vo.setTitle(title);
		vo.setContent(content);
		vo.setImportance(importance);
		vo.setTarget(target);
		
		return vo;
	}
}
