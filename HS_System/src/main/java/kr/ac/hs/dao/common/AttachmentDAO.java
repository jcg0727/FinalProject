package kr.ac.hs.dao.common;

import java.sql.SQLException;

import kr.ac.hs.dto.common.AttachVO;

public interface AttachmentDAO {
	public String selectAttachSequence() throws SQLException;
	
	public void insertAttachment(AttachVO attach) throws SQLException;

	public AttachVO selectAttachByAttachNo(String attach_no);
}
