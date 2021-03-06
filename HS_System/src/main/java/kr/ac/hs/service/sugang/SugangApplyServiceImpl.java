package kr.ac.hs.service.sugang;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.w3c.dom.ls.LSInput;

import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;

import kr.ac.hs.command.PageMaker;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.lecture.LecturePlanCommand;
import kr.ac.hs.command.sugang.ApplyCompleteLectureCommand;
import kr.ac.hs.command.sugang.ApplyExpectedLectureCommand;
import kr.ac.hs.command.sugang.ApplyLessonCommand;
import kr.ac.hs.command.sugang.LectureRegisterCommand;
import kr.ac.hs.command.sugang.SugangApplyCommand;
import kr.ac.hs.dao.sugang.SugangApplyDAO;
import kr.ac.hs.dto.lecture.LecturePlanVO2;
import kr.ac.hs.dto.lecture.LectureVO;
import kr.ac.hs.dto.sugang.ApplyCompleteLectureVO;
import kr.ac.hs.dto.sugang.ApplyExpectedLectureVO;
import kr.ac.hs.dto.sugang.ApplyLessonVO;
import kr.ac.hs.dto.sugang.BoguanVO;
import kr.ac.hs.dto.sugang.LectureEvaluationScoreVO;
import kr.ac.hs.dto.sugang.LectureListVO;
import kr.ac.hs.dto.sugang.LectureRegisterVO;
import kr.ac.hs.dto.sugang.SugangApplySuccessVO;

public class SugangApplyServiceImpl implements SugangApplyService {
	
	private SugangApplyDAO sugangApplyDAO;
	
	public void setSugangApplyDAO(SugangApplyDAO sugangApplyDAO) {
		this.sugangApplyDAO = sugangApplyDAO;
	}
	
	@Override
	public Map<String, Object> getTimeTable(ApplyCompleteLectureCommand cmd) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("student_no", cmd.getStudent_no());
		
		List<ApplyCompleteLectureVO> completeLectureList = sugangApplyDAO.SelectApplyCompleteLecture(cmd);
		
		
		return null;
	}

	@Override
	public Map<String,Object> getLectureList(String dept_no, String class_name, String class_year, String class_type, SearchCriteria cri) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("dept_no", dept_no);
		dataMap.put("class_name", class_name);
		dataMap.put("class_year", class_year);
		dataMap.put("class_type", class_type);
		dataMap.put("cri", cri);
		int totalCount = sugangApplyDAO.selectCountLectureList(dataMap);
		
		List<LectureListVO> lectureList = sugangApplyDAO.selectLectureList(dataMap);		
		PageMaker pageMaker = new PageMaker();		
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("lectureList", lectureList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getLectureList_year(String dept_no, String student_no, SearchCriteria cri) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("dept_no", dept_no);
		dataMap.put("student_no", student_no);
		dataMap.put("cri", cri);
		int totalCount = sugangApplyDAO.selectCountGausulTotalList(dataMap);
		
		List<LectureListVO> lectureList_year = sugangApplyDAO.selectLectureList_year(dataMap);
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("lectureList_year", lectureList_year);
	
		return dataMap;
	}
	
	
	
	@Override
	public String registLectureList(ApplyCompleteLectureCommand cmd) throws SQLException {
		
		String result="";
		 
		List<ApplyCompleteLectureVO> applyCompleteLectureList = sugangApplyDAO.SelectApplyCompleteLecture(cmd);
		List<ApplyExpectedLectureVO> expectedLectureList = sugangApplyDAO.SelectApplyExpectedLecture(cmd);
	
		for (ApplyCompleteLectureVO completed : applyCompleteLectureList ) {
	
			for (ApplyExpectedLectureVO expected : expectedLectureList) {
				String startTime = completed.getClass_start_time();
				String endTime= completed.getClass_end_time();
				
				// endTime??? null ?????? startTime??? ????????? ????????????
				if(endTime == null) {
					endTime = startTime;
				}
				
				int completedStart = Integer.parseInt(startTime.substring(3));
				int completeEnd = Integer.parseInt(endTime.substring(3));
				
				if(completed.getClass_day().equals(expected.getClass_day())) {
					String startTime2 = expected.getClass_start_time();
					String endTime2= expected.getClass_end_time();
					
					// endTime??? null ?????? startTime??? ????????? ????????????
					if(endTime2 == null) {
						endTime2 = startTime2;
					}
					
					int expectedStart = Integer.parseInt(startTime2.substring(3));
					int expectedEnd = Integer.parseInt(endTime2.substring(3));
					
					if((completedStart <= expectedStart && expectedStart <= completeEnd)
						||(completedStart <= expectedEnd && expectedEnd <= completeEnd)) {
						result="OVERLAP";
					}
				}
			}
		}
		
		int sugang_list = sugangApplyDAO.checkLectureApplyList(cmd);
		int apply_status = sugangApplyDAO.selectCheckApplyStatus(cmd);
		int total_personnel = Integer.parseInt(cmd.getPersonnel());
		
		if(apply_status >= total_personnel) {
			return "OVER";
			
		} else if (sugang_list >= 1) {
			return "NO";
			
		} else if (result.equals("OVERLAP")) {
			return "OVERLAP";
			
		} else {
			sugangApplyDAO.insertLectureList(cmd);
			return "OK";
		} 
		
	}
	

	@Override
	public String updateBoguanToSugangSuccess(ApplyCompleteLectureCommand cmd) throws SQLException {
		
		String result="";
		 
		List<ApplyCompleteLectureVO> applyCompleteLectureList = sugangApplyDAO.SelectApplyCompleteLecture(cmd);
		List<ApplyExpectedLectureVO> expectedLectureList = sugangApplyDAO.SelectApplyExpectedLecture(cmd);
	
		for (ApplyCompleteLectureVO completed : applyCompleteLectureList ) {
	
			for (ApplyExpectedLectureVO expected : expectedLectureList) {
				String startTime = completed.getClass_start_time();
				String endTime= completed.getClass_end_time();
				
				// endTime??? null ?????? startTime??? ????????? ????????????
				if(endTime == null) {
					endTime = startTime;
				}
				
				int completedStart = Integer.parseInt(startTime.substring(3));
				int completeEnd = Integer.parseInt(endTime.substring(3));
				
				if(completed.getClass_day().equals(expected.getClass_day())) {
					String startTime2 = expected.getClass_start_time();
					String endTime2= expected.getClass_end_time();
					
					// endTime??? null ?????? startTime??? ????????? ????????????
					if(endTime2 == null) {
						endTime2 = startTime2;
					}
					
					int expectedStart = Integer.parseInt(startTime2.substring(3));
					int expectedEnd = Integer.parseInt(endTime2.substring(3));
					
					if((completedStart <= expectedStart && expectedStart <= completeEnd)
						||(completedStart <= expectedEnd && expectedEnd <= completeEnd)) {
						result="OVERLAP";
					}
				}
			}
		}
		
		int sugang_list = sugangApplyDAO.checkLectureApplyList(cmd);
		int apply_status = sugangApplyDAO.selectCheckApplyStatus(cmd);
		int total_personnel = Integer.parseInt(cmd.getPersonnel());
		
		if(apply_status >= total_personnel) {
			return "OVER";
			
		} else if (sugang_list >= 1) {
			return "NO";
			
		} else if (result.equals("OVERLAP")) {
			return "OVERLAP";
			
		} else {
			sugangApplyDAO.changeBoguanToSugangSuccess(cmd);
			return "OK";
		} 
		
	}
	

	@Override
	public String registBoguanList(LectureRegisterCommand cmd) throws SQLException {
		
		int boguan_list = sugangApplyDAO.checkLectureBoguanList(cmd);
		
		if(boguan_list == 0) {
			sugangApplyDAO.insertBoguanList(cmd);
			return "OK";
		} else {
			return "NO"; 
		}
		
	}
	
	@Override
	public Map<String, Object> getBoguanList(String dept_no, String student_no, SearchCriteria cri) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("dept_no", dept_no);
		dataMap.put("student_no", student_no);
		dataMap.put("cri",cri);
		int totalCount = sugangApplyDAO.selectCountBoguanList(dataMap); // ????????? ????????? total?????? ?????????
		
		List<BoguanVO> boguanList = sugangApplyDAO.selectBoguanList(dataMap); // 
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("boguanList", boguanList);
		dataMap.put("pageMaker", pageMaker);
	
		return dataMap; 
	}

	@Override
	public Map<String, Object> getSugangApplySuccessList(String dept_no, String student_no, SearchCriteria cri) throws SQLException{
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("dept_no", dept_no);
		dataMap.put("student_no", student_no);
		dataMap.put("cri",cri);
		int totalCount = sugangApplyDAO.selectCountSugangApplySuccessList(dataMap); 
		
		List<SugangApplySuccessVO> sugangList = sugangApplyDAO.selectSugangApplySuccessList(dataMap);
		
		int applyGrade = 0;
		for (SugangApplySuccessVO sugangApplySuccessVO : sugangList) {
			applyGrade += sugangApplySuccessVO.getClass_grade();
		}
	
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("sugangList", sugangList);
		dataMap.put("applyGrade", applyGrade);
		dataMap.put("pageMaker", pageMaker);
	
		return dataMap;
	}

	// ??????????????? ??????
	@Override
	public Map<String, Object> getLecturePlan(String class_no) throws SQLException {
	
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("class_no", class_no);
	
		LecturePlanVO2  lecturePlanList = sugangApplyDAO.selectLecturePlan2(class_no);
		dataMap.put("lecturePlanList", lecturePlanList);
		
		return dataMap;
	}
	
	// ???????????? ?????? (??????)
	@Override
	public Map<String, Object> getLectureEvaluation(String class_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("class_no", class_no);
		
		LectureEvaluationScoreVO lectureEvaluationScore = sugangApplyDAO.selectLectureEvalutaionScore(class_no);
		dataMap.put("lectureEvaluationScore", lectureEvaluationScore);
		
		return dataMap;
	}
	
	// ???????????? ?????? (6?????????)
	@Override
	public Map<String, Object> getLectureEvaluationQ_6(String class_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("class_no", class_no);
		
		List<String> listQ_6 = sugangApplyDAO.selectLectureEvaluationQ6(class_no);
		dataMap.put("listQ_6", listQ_6);
		return dataMap;
	}

	
	
	@Override
	public String removeBoguan(LectureRegisterVO lectureRegister) throws SQLException {
		sugangApplyDAO.deleteBoguan(lectureRegister);
		return "OK";
	}

	@Override
	public String removeSugang(LectureRegisterVO lectureRegister) throws SQLException {
		sugangApplyDAO.deleteSugang(lectureRegister);
		return "OK";
	}

	@Override
	public List<ApplyLessonVO> getApplyLessonList(ApplyLessonCommand cmd) throws SQLException {
		
		List<ApplyLessonVO> applyLessonList = sugangApplyDAO.selectApplyLessonList(cmd);
	
		return applyLessonList;
	}

	@Override
	public List<ApplyLessonVO> getProfTimeTableList(ApplyLessonCommand cmd) throws SQLException {
		List<ApplyLessonVO> profTimeTableList = sugangApplyDAO.selectProfLessonList(cmd);
		return profTimeTableList;
	}

	

}
