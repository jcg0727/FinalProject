package kr.ac.hs.service.tuition;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.PageMaker;
import kr.ac.hs.command.scholar.ScholarSearchCriCommand;
import kr.ac.hs.dao.tuition.TuitionDAO;
import kr.ac.hs.dto.tuition.TuitionVO;

public class TuitionServiceImpl implements TuitionService {
	
	private TuitionDAO tuitionDAO;
	
	public TuitionDAO getTuitionDAO() {
		return tuitionDAO;
	}

	public void setTuitionDAO(TuitionDAO tuitionDAO) {
		this.tuitionDAO = tuitionDAO;
	}

	@Override
	public List<TuitionVO> getTuitionList(String student_no) throws SQLException {
		List<TuitionVO> tuitionList = tuitionDAO.selectTuitionList(student_no);
		
		return tuitionList;
		
	}

	@Override
	public List<TuitionVO> getTuitionDetail(TuitionVO tuitionVO) throws SQLException {
		List<TuitionVO> tuitionDetailList = tuitionDAO.selectTuitionDetail(tuitionVO);
		return tuitionDetailList;
	}

	@Override
	public void modifyPayTuition(TuitionVO tuitionVO) throws SQLException {
		tuitionDAO.updatePayTuition(tuitionVO);
	}

	

}
