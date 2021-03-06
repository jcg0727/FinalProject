package kr.ac.hs.service.tuition;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.dto.tuition.TuitionVO;

public interface TuitionService {
	
	List<TuitionVO> getTuitionList (String student_no) throws SQLException;

	List<TuitionVO> getTuitionDetail (TuitionVO tuitionVO) throws SQLException;
	
	void modifyPayTuition(TuitionVO tuitionVO) throws SQLException;
	
}
