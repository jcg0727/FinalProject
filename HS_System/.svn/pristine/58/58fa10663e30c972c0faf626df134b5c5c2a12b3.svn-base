package kr.ac.hs.dao.sugang;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.command.Criteria;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dao.sugang.ExSugangListDAO;
import kr.ac.hs.dto.sugang.ExSugangListVO;

public class ExSugangListDAOImpl implements ExSugangListDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<ExSugangListVO> SugangInfoBystudent_no(String student_no, String lecture_semester) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("student_no", student_no);
		dataMap.put("lecture_semester", lecture_semester);
		
		List<ExSugangListVO> infoList = session.selectList("ExSugangList-Mapper.sugangInfoBystudent_no",dataMap);
		return infoList;
	}

	@Override
	public List<ExSugangListVO> SelectTookClassesByStudent_no(String student_no) throws SQLException {
		List<ExSugangListVO> sugangList = session.selectList("ExSugangList-Mapper.selectTookClassesByStudent_no",student_no);		
		return sugangList;
	}
	
	@Override
	public List<ExSugangListVO> SelectTookClassesByStudent_no(String student_no, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<ExSugangListVO> sugangList = session.selectList("ExSugangList-Mapper.selectTookClassesByStudent_no",student_no,rowBounds);		
		return sugangList;
	}
	
	@Override
	public List<ExSugangListVO> SelectTookClassesByStudent_no(String student_no, SearchCriteria cri)throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		Map<String,Object> dataMap = new HashMap<String, Object>();
		dataMap.put("student_no", student_no);
		dataMap.put("cri", cri);
		
		List<ExSugangListVO> sugangList = session.selectList("ExSugangList-Mapper.selectSearchTookClassesByStudent_no", dataMap, rowBounds);
		return sugangList;
	}


	@Override
	public List<ExSugangListVO> SelectClassesOpenThisSemester(String student_no, String lecture_semester)throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("student_no", student_no);
		dataMap.put("lecture_semester", lecture_semester);
		
		List<ExSugangListVO> openList = session.selectList("ExSugangList-Mapper.selectClassesOpenThisSemester",dataMap);		

		return openList;
	}

	@Override
	public List<ExSugangListVO> selectListYear(String student_no) throws SQLException {
		List<ExSugangListVO> yearList = session.selectList("ExSugangList-Mapper.selectListYear", student_no);
		return yearList;
	}

	@Override
	public int selectCountTookClassesByStudent_no(String student_no, SearchCriteria cri) throws SQLException {
		int count = 0;
		
		Map<String,Object> dataMap = new HashMap<String, Object>();
		dataMap.put("student_no", student_no);
		dataMap.put("cri", cri);
		
		count = session.selectOne("ExSugangList-Mapper.selectCountTookClassesByStudent_no", dataMap);
		System.out.println("countFromDAO: " + count);
		return count;
	}




}
