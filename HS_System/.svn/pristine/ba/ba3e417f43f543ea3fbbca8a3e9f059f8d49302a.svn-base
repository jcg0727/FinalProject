package kr.ac.hs.dao.common;

import java.sql.SQLException;
import java.util.List;

import kr.ac.hs.dto.common.AnnounceVO;

public interface AnnounceDAO {

	public String selectAnnounceSeq()throws SQLException;
	
	public void insertAnnounce(AnnounceVO announce) throws SQLException;
	
	public List<AnnounceVO> selectAnnounce(String account_no) throws SQLException;
	
	public int selectNewAnnounceCount(String account_no) throws SQLException;
	
	public void updateAnno_noToY(String anno_no)throws SQLException;
	

}
