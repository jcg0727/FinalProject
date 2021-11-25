package kr.ac.hs.dao.common;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.dto.common.AttachVO;

public class AttachmentDAOImpl implements AttachmentDAO{

	private SqlSession session;
	private String namespace = "Attach-Mapper.";
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public String selectAttachSequence() throws SQLException {
		String seq = session.selectOne(namespace+"selectAttchSeq");
		return seq;
	}

	@Override
	public void insertAttachment(AttachVO attach) throws SQLException {
		session.update(namespace+"insertAttachment", attach);
	}

	@Override
	public AttachVO selectAttachByAttachNo(String attach_no) {
		AttachVO attach = session.selectOne(namespace+"selectAttachByAttachNo", attach_no);
		return attach;
	}

}
