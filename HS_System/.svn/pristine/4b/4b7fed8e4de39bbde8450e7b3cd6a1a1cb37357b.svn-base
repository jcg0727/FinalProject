package kr.ac.hs.dao.academic;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.academic.PluralMajorVO;

public class PluralMajorDAOImpl implements PluralMajorDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<PluralMajorVO> selectPluralMajorByStudentNO(String student_no) throws SQLException {
		List<PluralMajorVO> pluralList = session.selectList("PluralMajor-Mapper.selectPluralMajorByStudentNO", student_no);
		return pluralList;
	}

	@Override
	public void insertPluralMajor(PluralMajorVO pluralMajor) throws SQLException {
		session.update("PluralMajor-Mapper.insertPluralMajor", pluralMajor);

	}

	@Override
	public int selectPluralSeqNext() throws SQLException {
		int seq_num = session.selectOne("PluralMajor-Mapper.selectPluralSeqNext");
		return seq_num;
	}

	@Override
	public void deletePlural(String student_no) throws SQLException {
		session.update("PluralMajor-Mapper.deletePlural", student_no);
		
	}

	@Override
	public List<PluralMajorVO> selectStudentInfoByPlural(String student_no) throws SQLException {
		List<PluralMajorVO> pluralList = session.selectList("PluralMajor-Mapper.selectStudentInfoByPlural",student_no);
		return pluralList;
	}

	@Override
	public List<PluralMajorVO> selectPluralByStaffDeptnm(Map<String, Object> dataMap) throws SQLException {
		SearchCriteria cri = (SearchCriteria) dataMap.get("cri");
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<PluralMajorVO> pluralList = session.selectList("PluralMajor-Mapper.selectPluralByStaffDeptnm",dataMap, rowBounds);
		return pluralList;
	}

	@Override
	public List<PluralMajorVO> selectStudentByApplyStaffDeptnm(Map<String, Object> dataMap) throws SQLException {
		SearchCriteria cri = (SearchCriteria) dataMap.get("cri");
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<PluralMajorVO> pluralList = session.selectList("PluralMajor-Mapper.selectStudentByApplyStaffDeptnm",dataMap);
		return pluralList;
	}

	@Override
	public int selectCountPluralMajor(Map<String, Object> dataMap) throws SQLException {
		int count = session.selectOne("PluralMajor-Mapper.selectCountPluralMajor", dataMap);
		return count;
	}

	@Override
	public PluralMajorVO selectStudentDetailByStudentNo(String student_no) throws SQLException {
		PluralMajorVO plural = session.selectOne("PluralMajor-Mapper.selectStudentDetailByStudentNo",student_no);
		return plural;
	}

}
