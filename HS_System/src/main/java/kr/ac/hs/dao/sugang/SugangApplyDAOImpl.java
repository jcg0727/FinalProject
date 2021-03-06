package kr.ac.hs.dao.sugang;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.sugang.ApplyCompleteLectureCommand;
import kr.ac.hs.command.sugang.ApplyLessonCommand;
import kr.ac.hs.command.sugang.LectureRegisterCommand;
import kr.ac.hs.dto.lecture.LecturePlanVO2;
import kr.ac.hs.dto.sugang.ApplyCompleteLectureVO;
import kr.ac.hs.dto.sugang.ApplyExpectedLectureVO;
import kr.ac.hs.dto.sugang.ApplyLessonVO;
import kr.ac.hs.dto.sugang.BoguanVO;
import kr.ac.hs.dto.sugang.LectureEvaluationScoreVO;
import kr.ac.hs.dto.sugang.LectureListVO;
import kr.ac.hs.dto.sugang.LectureRegisterVO;
import kr.ac.hs.dto.sugang.SugangApplySuccessVO;

public class SugangApplyDAOImpl implements SugangApplyDAO {
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}	

	@Override
	public List<LectureListVO> selectLectureList(Map<String, Object> dataMap) throws SQLException {
		SearchCriteria cri = (SearchCriteria) dataMap.get("cri");
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset,	limit);
		List<LectureListVO> LectureList = session.selectList("SugangApply-Mapper.selectLectureList", dataMap, rowBounds);
		
		return LectureList;
	}
	
	@Override
	public int selectCountLectureList(Map<String, Object> dataMap) throws SQLException {
		int count = session.selectOne("SugangApply-Mapper.selectCountLectureList", dataMap);
		return count;
	}


	@Override
	public List<LectureListVO> selectLectureList_year(Map<String, Object> dataMap) throws SQLException {
		SearchCriteria cri = (SearchCriteria) dataMap.get("cri");
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<LectureListVO> LectureList_year = session.selectList("SugangApply-Mapper.selectLectureList_year",dataMap, rowBounds);
		return LectureList_year;
	}

	@Override
	public int selectCountGausulTotalList(Map<String, Object> dataMap) throws SQLException {
		int count = session.selectOne("SugangApply-Mapper.selectCountGausulTotalList", dataMap);
		return count;
	}


	
	@Override
	public int checkLectureApplyList(LectureRegisterCommand cmd) throws SQLException {
		int count = session.selectOne("SugangApply-Mapper.checkLectureApplyList", cmd);
		return count;
	}

	@Override
	public int checkLectureBoguanList(LectureRegisterCommand cmd) throws SQLException {
		int count = session.selectOne("SugangApply-Mapper.checkLectureBoguanList", cmd);
		return count;
	}

	@Override
	public String insertLectureList(LectureRegisterCommand cmd) throws SQLException {
		session.insert("SugangApply-Mapper.insertLectureList", cmd);
		return "OK";
	}
	
	@Override
	public String insertBoguanList(LectureRegisterCommand cmd) throws SQLException {
		session.insert("SugangApply-Mapper.insertBoguanList", cmd);
		return "OK";
	}


	@Override
	public List<BoguanVO> selectBoguanList(Map<String, Object> dataMap) throws SQLException {
		SearchCriteria cri = (SearchCriteria) dataMap.get("cri");
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<BoguanVO> boguanList = session.selectList("SugangApply-Mapper.selectBoguanList", dataMap, rowBounds);
		
		return boguanList;
	}
	
	@Override
	public int selectCountBoguanList(Map<String, Object> dataMap) throws SQLException {
		int count = session.selectOne("SugangApply-Mapper.selectCountBoguanList", dataMap);
		return count;
	}

	@Override
	public List<SugangApplySuccessVO> selectSugangApplySuccessList(Map<String, Object> dataMap) throws SQLException {
		SearchCriteria cri = (SearchCriteria) dataMap.get("cri");
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<SugangApplySuccessVO> sugangApplySuccessList = session.selectList("SugangApply-Mapper.selectSugangApplySuccessList", dataMap, rowBounds);
		
		return sugangApplySuccessList;
	}

	@Override
	public int selectCountSugangApplySuccessList(Map<String, Object> dataMap) throws SQLException {
		int count = session.selectOne("SugangApply-Mapper.selectCountSugangApplySuccessList", dataMap);
		return count;
	}

	@Override
	public void deleteBoguan(LectureRegisterVO lectureRegister) throws SQLException {
		session.selectOne("SugangApply-Mapper.deleteBoguan",lectureRegister);
	}

	@Override
	public void deleteSugang(LectureRegisterVO lectureRegister) throws SQLException {
		session.selectOne("SugangApply-Mapper.deleteSugang",lectureRegister);
	}

	@Override
	public void changeBoguanToSugangSuccess(LectureRegisterCommand cmd) throws SQLException {
		session.selectOne("SugangApply-Mapper.changeBoguanToSugangSuccess",cmd);
	}

	@Override //??????????????????
	public int selectCheckApplyStatus(LectureRegisterCommand cmd) throws SQLException {
		int count = session.selectOne("SugangApply-Mapper.selectCheckApplyStatus", cmd);
		return count;
	}

	@Override
	public int selectApplyScores(LectureRegisterCommand cmd) throws SQLException {
		int count = session.selectOne("SugangApply-Mapper.selectApplyScores", cmd);
		return count;
	}

	// ??????????????? ?????? (??????,??????)
	@Override
	public List<ApplyCompleteLectureVO> SelectApplyCompleteLecture(ApplyCompleteLectureCommand cmd)
			throws SQLException {
		List<ApplyCompleteLectureVO> applyCompleteLectureList = session.selectList("SugangApply-Mapper.SelectApplyCompleteLecture", cmd);
		return applyCompleteLectureList;
	}
	
	// ??????????????? ?????? (??????, ??????)
	@Override
	public List<ApplyExpectedLectureVO> SelectApplyExpectedLecture(ApplyCompleteLectureCommand cmd)
			throws SQLException {
		List<ApplyExpectedLectureVO> applyExpectedLectureList = session.selectList("SugangApply-Mapper.SelectApplyExpectedLecture", cmd);
		return applyExpectedLectureList;
	}

	// ??????????????? ??????
	@Override
	public LecturePlanVO2 selectLecturePlan2(String class_no) throws SQLException {
		LecturePlanVO2 lecturePlanList = session.selectOne("SugangApply-Mapper.selectLecturePlan2", class_no);
		return lecturePlanList;
	}

	// ???????????? ??????
	@Override
	public LectureEvaluationScoreVO selectLectureEvalutaionScore(String class_no) throws SQLException {
		LectureEvaluationScoreVO lectureEvaluationScore = session.selectOne("SugangApply-Mapper.selectLectureEvaluationScore", class_no);
		return lectureEvaluationScore;
	}
	
	// ???????????? 6?????????
	@Override
	public List<String> selectLectureEvaluationQ6 (String class_no) throws SQLException {
		List<String> listQ_6 = session.selectList("SugangApply-Mapper.selectLectureEvaluationQ6",class_no);
		return listQ_6;
	}

	// ???????????? ??????????????? ?????????
	@Override
	public List<ApplyLessonVO> selectApplyLessonList(ApplyLessonCommand cmd) throws SQLException {
		List<ApplyLessonVO> applyLessonList = session.selectList("SugangApply-Mapper.selectApplyLessonList", cmd);
		return applyLessonList;
	}
	
	// ???????????? ??????????????? ?????????(??????)
	@Override
	public List<ApplyLessonVO> selectProfLessonList(ApplyLessonCommand cmd) throws SQLException {
		List<ApplyLessonVO> profTimeTableList = session.selectList("SugangApply-Mapper.selectProfLessonList", cmd);
		return profTimeTableList;
	}

}
