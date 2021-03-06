package kr.ac.hs.dao.tuition;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.dto.tuition.TuitionVO;

public interface TuitionDAO {
	
	List<TuitionVO> selectTuitionList(String student_no) throws SQLException;

	List<TuitionVO> selectTuitionDetail(TuitionVO tuitionVO) throws SQLException;
	
	void updatePayTuition(TuitionVO tuitionVO) throws SQLException;
		
	
}

