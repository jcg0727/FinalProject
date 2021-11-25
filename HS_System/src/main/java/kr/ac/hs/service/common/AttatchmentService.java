package kr.ac.hs.service.common;

import java.sql.SQLException;

import kr.ac.hs.dto.common.AttachVO;

public interface AttatchmentService {
	public String regist(AttachVO attach) throws SQLException;

	public AttachVO getAttach(String attach_no);
}
