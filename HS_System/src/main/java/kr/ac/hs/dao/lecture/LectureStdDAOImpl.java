package kr.ac.hs.dao.lecture;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.lecture.LectureVO;

public class LectureStdDAOImpl implements LectureStdDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<LectureVO> lectureStuBasicList(SearchCriteria cri, String student_no) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("cri", cri);
		dataMap.put("student_no", student_no);

		List<LectureVO> lectureList = session.selectList("LectureStd-Mapper.lectureStuBasicList", dataMap, rowBounds);
		return lectureList;
	}

	@Override
	public LectureVO selectLectureDetail(String class_no, String lecture_semester) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("lecture_semester", lecture_semester);
		dataMap.put("class_no", class_no);
		LectureVO lecture = session.selectOne("LectureStd-Mapper.lectureStuPlanDetail", dataMap);
		
		return lecture;
	}

}
