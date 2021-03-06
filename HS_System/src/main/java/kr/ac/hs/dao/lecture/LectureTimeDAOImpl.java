package kr.ac.hs.dao.lecture;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.lecture.LectureTimeVO;
import kr.ac.hs.dto.lecture.LectureVO;

public class LectureTimeDAOImpl implements LectureTimeDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<LectureVO> selectLectureList(SearchCriteria cri) throws SQLException {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);		
		List<LectureVO> lectureList = session.selectList("LectureTime-Mapper.selectLectureList", cri, rowBounds);
		return lectureList;
		
	}

	@Override
	public int selectCountLectureList(SearchCriteria cri) throws SQLException {
		int count = session.selectOne("LectureTime-Mapper.selectCountLectureList", cri);
		return count;
	}

	@Override
	public List<LectureVO> selectLectureListByStaffNo(Map<String, Object> dataMap) throws SQLException {
		SearchCriteria cri = (SearchCriteria) dataMap.get("cri");
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		List<LectureVO> lectureList = session.selectList("LectureTime-Mapper.selectLectureListByStaffNo",dataMap,rowBounds);
		return lectureList;
	}

	@Override
	public int selectCountStaffLectureList(Map<String, Object> dataMap) throws SQLException {
		int count = session.selectOne("LectureTime-Mapper.selectCountStaffLectureList",dataMap);
		return count;
	}

	@Override
	public List<LectureVO> selectLectureProfessorByClassNo(Map<String, Object> dataMap) throws SQLException {
		List<LectureVO> lectureList = session.selectList("LectureTime-Mapper.selectLectureProfessorByClassNo", dataMap);
		return lectureList;
	}

	@Override
	public List<LectureVO> selectProlistByStaffNo(Map<String, Object> dataMap) throws SQLException {
		SearchCriteria cri = (SearchCriteria) dataMap.get("cri");
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		List<LectureVO> proList = session.selectList("LectureTime-Mapper.selectProlistByStaffNo",dataMap, rowBounds);
		return proList;
	}

	@Override
	public int selectCountProList(Map<String, Object> dataMap) throws SQLException {
		int count = session.selectOne("LectureTime-Mapper.selectCountProList", dataMap);
		return count;
	}

	@Override
	public void updateProfessor(LectureVO lecture) throws SQLException {
		session.update("LectureTime-Mapper.updateProfessor", lecture);
		
	}

	@Override
	public List<LectureVO> lectureTime(Map<String, Object> dataMap) throws SQLException {
		List<LectureVO> timeList = session.selectList("LectureTime-Mapper.lectureTime",dataMap);
		return timeList;
	}

	@Override
	public void updateTimetable(LectureTimeVO lectureTime) throws SQLException {
		session.update("LectureTime-Mapper.updateTimetable", lectureTime);
		
	}


}
