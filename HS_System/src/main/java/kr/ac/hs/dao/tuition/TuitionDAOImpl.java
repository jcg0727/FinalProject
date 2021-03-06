package kr.ac.hs.dao.tuition;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.tuition.TuitionVO;

public class TuitionDAOImpl implements TuitionDAO {
	
	private SqlSession session;
	private String namespace = "Tuition-Mapper.";
	
	public void setSqlsession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<TuitionVO> selectTuitionList(String student_no) throws SQLException {
		
		List<TuitionVO> tuitionList = session.selectList(namespace + "selectTuitionList", student_no);
		return tuitionList;
	}

	@Override
	public List<TuitionVO> selectTuitionDetail(TuitionVO tuitionVO) throws SQLException {
		List<TuitionVO> tuitionDetailList = session.selectList(namespace + "selectTuitionDetail", tuitionVO);
		return tuitionDetailList;
	}

	@Override
	public void updatePayTuition(TuitionVO tuitionVO) throws SQLException {
		session.update(namespace + "updatePayTuition", tuitionVO);
	}

   


}
