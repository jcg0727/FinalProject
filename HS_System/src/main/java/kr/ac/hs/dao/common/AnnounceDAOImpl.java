package kr.ac.hs.dao.common;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.dto.common.AnnounceVO;

public class AnnounceDAOImpl implements AnnounceDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public String selectAnnounceSeq() throws SQLException {
		String seq = session.selectOne("Announce-Mapper.selectAnnounceSeq");
		return seq;
	}

	@Override
	public void insertAnnounce(AnnounceVO announce) throws SQLException {
		session.insert("Announce-Mapper.insertAnnounce", announce);
	}

	@Override
	public List<AnnounceVO> selectAnnounce(String account_no) throws SQLException {
		List<AnnounceVO> list = session.selectList("selectAnnounce", account_no);
		return list;
	}

	@Override
	public int selectNewAnnounceCount(String account_no) throws SQLException {
		int count = 0;
		count = session.selectOne("selectNewAnnounceCount", account_no);
		return count;
	}

	@Override
	public void updateAnno_noToY(String anno_no) throws SQLException {
		session.update("updateAnno_noToY", anno_no);
	}


}
