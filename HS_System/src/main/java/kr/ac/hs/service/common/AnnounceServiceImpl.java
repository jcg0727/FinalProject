package kr.ac.hs.service.common;

import java.sql.SQLException;
import java.util.List;

import kr.ac.hs.dao.common.AnnounceDAO;
import kr.ac.hs.dto.common.AnnounceVO;

public class AnnounceServiceImpl implements AnnounceService {

	private AnnounceDAO announceDAO;
	public void setAnnounceDAO(AnnounceDAO announceDAO) {
		this.announceDAO = announceDAO;
	}
	
	@Override
	public void regist(AnnounceVO announce) throws SQLException {
		String seq = announceDAO.selectAnnounceSeq();
		
		announce.setAnno_no(seq);
		announceDAO.insertAnnounce(announce);
	}

	@Override
	public List<AnnounceVO> selectAnnounce(String account_no) throws SQLException {
		List<AnnounceVO> list = announceDAO.selectAnnounce(account_no);
		return list;
	}

	@Override
	public int selectNewAnnounceCount(String account_no) throws SQLException {
		int count = 0;
		count = announceDAO.selectNewAnnounceCount(account_no);
		return count;
	}

	@Override
	public void updateAnno_noToY(String anno_no) throws SQLException {
		announceDAO.updateAnno_noToY(anno_no);
	}



}
