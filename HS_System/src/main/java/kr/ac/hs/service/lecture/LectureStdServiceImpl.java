package kr.ac.hs.service.lecture;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.PageMaker;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dao.lecture.LectureStdDAO;
import kr.ac.hs.dto.lecture.LectureVO;

public class LectureStdServiceImpl implements LectureStdService {
	private LectureStdDAO lecDAO;

	public void setLecDAO(LectureStdDAO lecDAO) {
		this.lecDAO = lecDAO;
	}

	@Override
	public Map<String, Object> getStdLectureList(SearchCriteria cri, String student_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<LectureVO> lectureList = lecDAO.lectureStuBasicList(cri, student_no);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(lectureList.get(0).getTotalcnt());

		dataMap.put("lectureList", lectureList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public LectureVO selectLectureDetail(String class_no, String lecture_semester) throws SQLException {
		LectureVO lecture = lecDAO.selectLectureDetail(class_no, lecture_semester);
		return lecture;
	}

}
