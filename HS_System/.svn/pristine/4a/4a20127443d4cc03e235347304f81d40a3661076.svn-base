package kr.ac.hs.service.sugang;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.Criteria;
import kr.ac.hs.command.PageMaker;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dao.sugang.ExSugangListDAO;
import kr.ac.hs.dto.sugang.ExSugangListVO;

public class ExSugangListServiceImpl implements ExSugangListService {
	private ExSugangListDAO exSugangListDAO;
	
	public void setExSugangListDAO(ExSugangListDAO exSugangListDAO) {
		this.exSugangListDAO = exSugangListDAO;
	}
	
	@Override
	public List<ExSugangListVO> sugangInfoBystudent_no(String student_no, String lecture_semester) throws SQLException {
		List<ExSugangListVO> infoList = exSugangListDAO.SugangInfoBystudent_no(student_no, lecture_semester);
		return infoList;
	}

	@Override
	public List<ExSugangListVO> selectTookClassesByStudent_no(String student_no) throws SQLException {
		List<ExSugangListVO> sugangList = exSugangListDAO.SelectTookClassesByStudent_no(student_no);
		return sugangList;
	}
	
	@Override
	public List<ExSugangListVO> selectTookClassesByStudent_no(String student_no, Criteria cri) throws SQLException {
		List<ExSugangListVO> sugangList = exSugangListDAO.SelectTookClassesByStudent_no(student_no,cri);
		return sugangList;
	}
	
	@Override
	public Map<String, Object> selectTookClassesByStudent_no(String student_no, SearchCriteria cri)throws SQLException {
		Map<String, Object>dataMap = new HashMap<String, Object>();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(exSugangListDAO.selectCountTookClassesByStudent_no(student_no, cri));
		
		List<ExSugangListVO> sugangList = exSugangListDAO.SelectTookClassesByStudent_no(student_no, cri);
		List<ExSugangListVO> yearList = exSugangListDAO.selectListYear(student_no);
		
		dataMap.put("sugangList", sugangList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("yearList", yearList);
		return dataMap;
	}

	@Override
	public List<ExSugangListVO> selectClassesOpenThisSemester(String student_no, String lecture_semester)throws SQLException {
		List<ExSugangListVO> openList = exSugangListDAO.SelectClassesOpenThisSemester(student_no, lecture_semester);
		return openList;
	}





}
