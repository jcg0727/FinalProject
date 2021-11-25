package kr.ac.hs.service.common;

import java.sql.SQLException;

import kr.ac.hs.dao.common.AttachmentDAO;
import kr.ac.hs.dto.common.AttachVO;

public class AttachmentServiceImpl implements AttatchmentService{
	
	private AttachmentDAO attachmentDAO;
	
	public void setAttachmentDAO(AttachmentDAO attachmentDAO) {
		this.attachmentDAO = attachmentDAO;
	}


	@Override
	public String regist(AttachVO attach) throws SQLException {
		String seq = attachmentDAO.selectAttachSequence();
		
		attach.setAttach_no(seq);
		attachmentDAO.insertAttachment(attach);
		
		return seq;
	}


	@Override
	public AttachVO getAttach(String attach_no) {
		AttachVO attach = attachmentDAO.selectAttachByAttachNo(attach_no);
		return attach;
	}

}
