package kr.ac.hs.service.grades;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.PageMaker;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.grades.DissenetRegistCommand;
import kr.ac.hs.command.grades.RegistGradesCommand;
import kr.ac.hs.dao.grades.GradesDAO;
import kr.ac.hs.dto.academic.StudentVO;
import kr.ac.hs.dto.grades.GradesDissentVO;
import kr.ac.hs.dto.grades.GradesVO;

public class GradesServiceImpl implements GradesService {

	private GradesDAO gradesDAO;

	public void setGradesDAO(GradesDAO gradesDAO) {
		this.gradesDAO = gradesDAO;
	}

	@Override
	public List<GradesVO> getGradesByStudentNo(String student_no) throws SQLException {
		List<GradesVO> gradesList = gradesDAO.selectGradesByStudentNo(student_no);
		return gradesList;
	}

	@Override
	public double getPreviousSemesterGradesByStudnetNo(String student_no) throws SQLException {
		double previousSemester = gradesDAO.selectPreviousSemesterGradesByStudnetNo(student_no);
		return previousSemester;
	}

	@Override
	public Map<String, Object> getThisSemesterGradesByStudentNo(GradesVO grades, SearchCriteria cri)
			throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		dataMap.put("grades", grades);
		dataMap.put("cri", cri);
		List<GradesVO> gradesList = gradesDAO.selectThisSemesterGradesByStudentNo(dataMap);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		if (gradesList != null && gradesList.size() > 0) {
			pageMaker.setTotalCount(gradesList.get(0).getTotalcnt());
		}

		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("pageMaker", pageMaker);
		resultMap.put("gradesList", gradesList);
		return resultMap;
	}

	@Override
	public Map<String, Object> getGradesBySemester(GradesVO grades, SearchCriteria cri) throws SQLException {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		Map<String, Object> dataMap = new HashMap<String, Object>();

		dataMap.put("grades", grades);
		dataMap.put("cri", cri);

		List<GradesVO> gradesList = gradesDAO.selectGradesBySemester(dataMap);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		if (gradesList != null && gradesList.size() > 0) {
			pageMaker.setTotalCount(gradesList.get(0).getTotalcnt());
		}

		resultMap.put("pageMaker", pageMaker);
		resultMap.put("semesterGradesList", gradesList);
		return resultMap;
	}

	@Override
	public GradesVO getTotalGradesByStudentNo(String student_no) throws SQLException {
		GradesVO grades = gradesDAO.selectTotalGradesByStudentNo(student_no);
		return grades;
	}

	@Override
	public List<String> getSemesterListByStudentNo(String student_no) throws SQLException {
		List<String> semesterList = gradesDAO.selectSemesterListByStudentNo(student_no);
		return semesterList;
	}

	@Override
	public void registGradesDissent(GradesDissentVO dissent) throws SQLException {
		String seq = gradesDAO.selectDissentSeq();

		dissent.setDissent_grades_no(seq);
		dissent.setStatus_cd("CCDY003");

		gradesDAO.insertGradesDissent(dissent);
	}

	@Override
	public GradesDissentVO getGradesDissent(GradesDissentVO dissent) throws SQLException {
		GradesDissentVO dissentVO = gradesDAO.selectDissentGrades(dissent);
		return dissentVO;
	}

	@Override
	public Map<String, Object> getPdfGrades(String student_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<String> semesterList = gradesDAO.selectSemesterListByStudentNo(student_no);
		List<GradesVO> gradesList = gradesDAO.selectPdfGradesByStudentNo(student_no);
		GradesVO grades = gradesDAO.selectPdfTotalGrades(student_no);

		dataMap.put("totalGrades", grades);
		dataMap.put("semesterList", semesterList);
		dataMap.put("gradesList", gradesList);

		return dataMap;
	}

	@Override
	public Map<String, Object> getDissentGradesListByProNo(Map<String, Object> paraMap) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		DissenetRegistCommand cmd = (DissenetRegistCommand) paraMap.get("cmd");

		List<GradesDissentVO> dissentList = gradesDAO.selectDissentGradesListByPronNo(paraMap);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cmd);

		if (dissentList != null && dissentList.size() > 0) {
			pageMaker.setTotalCount(dissentList.get(0).getTotalcnt());
		}

		dataMap.put("pageMaker", pageMaker);
		dataMap.put("dissentList", dissentList);

		return dataMap;
	}

	@Override
	public Map<String, Object> getStudentListByClassNo(Map<String, Object> paraMap) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<StudentVO> studenList = gradesDAO.selectStduentListByClassNo(paraMap);

		PageMaker pageMaker = new PageMaker();
		RegistGradesCommand cri = (RegistGradesCommand) paraMap.get("cri");

		pageMaker.setCri(cri);
		if (studenList != null && studenList.size() > 0) {
			pageMaker.setTotalCount(studenList.get(0).getTotalcnt());
		}

		dataMap.put("pageMaker", pageMaker);
		dataMap.put("studentList", studenList);

		return dataMap;
	}

	@Override
	public void registGrades(GradesVO grades) throws SQLException {

		GradesVO gradesVO = gradesDAO.selectGradesFromPorfByStudentNo(grades);
		
		if(gradesVO == null) {
			gradesDAO.insertGrades(grades);
		}else{
			gradesDAO.updateGrades(grades);
		}
		
	}

	@Override
	public GradesVO getGradesByStudentNoAndClassNo(GradesVO grades) throws SQLException {
		GradesVO gradesVO = gradesDAO.selectGradesFromPorfByStudentNo(grades);
		return gradesVO;
	}

	@Override
	public GradesDissentVO getDissentDetailFromProf(String dissentNo) throws SQLException {
		GradesDissentVO dissent = gradesDAO.selectDissentGradesByDissentNo(dissentNo);
		return dissent;
	}

	@Override
	public void modifyDissentGradesFromProf(GradesDissentVO dissent) throws SQLException {
		gradesDAO.updateDissentGradesFromProf(dissent);
	}
	
	@Override
	public void modifyTotalGrades(GradesVO grades) throws SQLException{
		gradesDAO.updateGradesForGradesCd(grades);
	}
}
