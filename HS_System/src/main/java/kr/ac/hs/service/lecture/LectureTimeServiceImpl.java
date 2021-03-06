package kr.ac.hs.service.lecture;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.PageMaker;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dao.lecture.LectureTimeDAO;
import kr.ac.hs.dto.lecture.LectureTimeVO;
import kr.ac.hs.dto.lecture.LectureVO;

public class LectureTimeServiceImpl implements LectureTimeService{

	private LectureTimeDAO lectureTimeDAO;
	public void setLectureTimeDAO(LectureTimeDAO lectureTimeDAO) {
		this.lectureTimeDAO = lectureTimeDAO;
	}
	
	
	@Override
	public Map<String, Object> getLectureTimeList(SearchCriteria cri) throws SQLException {
		 Map<String, Object> dataMap = new HashMap<String, Object>();
		// cri.setPerPageNum(5);
		 List<LectureVO> lectureTimeList = lectureTimeDAO.selectLectureList(cri);
		 
		 int totalCount = lectureTimeDAO.selectCountLectureList(cri);
		 
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		 
		dataMap.put("lectureTimeList", lectureTimeList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;

	}


	@Override
	public Map<String, Object> getStaffLectureTimeList(Map<String,Object> dataMap) throws SQLException {
		
		List<LectureVO> lectureTimeList = lectureTimeDAO.selectLectureListByStaffNo(dataMap);
		int totalCount = lectureTimeDAO.selectCountStaffLectureList(dataMap);
		
		PageMaker pageMaker = new PageMaker();
		SearchCriteria cri = (SearchCriteria) dataMap.get("cri");
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		dataMap.put("lectureTimeList", lectureTimeList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}


	@Override
	public Map<String,Object> selectLectureProfessorByClassNo(Map<String, Object> dataMap) throws SQLException {
		List<LectureVO> lectureList = lectureTimeDAO.selectLectureProfessorByClassNo(dataMap);
		dataMap.put("lectureList", lectureList);
		return dataMap;
	}


	@Override
	public Map<String, Object> selectProlistByStaffNo(Map<String, Object> dataMap) throws SQLException {
		List<LectureVO> proList = lectureTimeDAO.selectProlistByStaffNo(dataMap);
		int totalCount = lectureTimeDAO.selectCountProList(dataMap);
		PageMaker pageMaker = new PageMaker();
		SearchCriteria cri = (SearchCriteria) dataMap.get("cri");
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		dataMap.put("proList", proList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}


	@Override
	public void modify(LectureVO lecture) throws SQLException {
		lectureTimeDAO.updateProfessor(lecture);
		
	}


	@Override
	public Map<String, Object> lectureTime(Map<String, Object> dataMap) throws SQLException {
		List<LectureVO> timeList = lectureTimeDAO.lectureTime(dataMap);
		dataMap.put("timeList", timeList);
		return dataMap;
	}


	@Override
	public void modify(LectureTimeVO lectureTime) throws SQLException {
		lectureTimeDAO.updateTimetable(lectureTime);
		
	}
	
}
