package kr.ac.hs.service.scholar;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.PageMaker;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.scholar.ScholarSearchCriCommand;
import kr.ac.hs.dao.scholar.ScholarDAO;
import kr.ac.hs.dto.scholar.ScholarStaffVO;
import kr.ac.hs.dto.scholar.ScholarVO;

public class ScholarServiceImpl implements ScholarService {

	private ScholarDAO scholarDAO;

	public ScholarDAO getScholarDAO() {
		return scholarDAO;
	}

	public void setScholarDAO(ScholarDAO scholarDAO) {
		this.scholarDAO = scholarDAO;
	}

	@Override
	public String getDeptNmDeptStaff(String staff_no) throws SQLException {
		String dept_nm = scholarDAO.selectDeptNmDeptStaff(staff_no);
		return dept_nm;
	}

	@Override
	public Map<String, Object> getStudentDeptStaffScoreList(Map<String, Object> dataMap) throws SQLException {

		List<ScholarVO> deptStaffScoreList = scholarDAO.selectStudentDeptStaffScoreList(dataMap);

		PageMaker pageMaker = new PageMaker();
		ScholarSearchCriCommand cri = (ScholarSearchCriCommand) dataMap.get("cri");

		pageMaker.setCri(cri);

		if (deptStaffScoreList != null && deptStaffScoreList.size() > 0) {
			pageMaker.setTotalCount(deptStaffScoreList.get(0).getTotalcnt());
		}

		dataMap.put("cri", cri);
		dataMap.put("deptStaffScoreList", deptStaffScoreList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;

	}

	@Override
	public void registDeptStaffScholar(String student_no) throws SQLException {
		scholarDAO.insertDeptStaffScholar(student_no);

	}

	@Override
	public void removeDeptStaffScholarStu(ScholarStaffVO scholarStaffVO) throws SQLException {
		scholarDAO.deleteDeptStaffScholarStu(scholarStaffVO);
	}

	@Override
	public Map<String, Object> getStudentScholarRecommend(Map<String, Object> dataMap) throws SQLException {
		List<ScholarVO> StaffRecommendList = scholarDAO.selectStudentScholarRecommend(dataMap);

		PageMaker pageMaker = new PageMaker();
		ScholarSearchCriCommand cri = (ScholarSearchCriCommand) dataMap.get("cri");

		pageMaker.setCri(cri);

		if (StaffRecommendList != null && StaffRecommendList.size() > 0) {
			pageMaker.setTotalCount(StaffRecommendList.get(0).getTotalcnt());
		}

		dataMap.put("cri", cri);
		dataMap.put("StaffRecommendList", StaffRecommendList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public void modifyScholarStaffStu(ScholarStaffVO scholarStaffVO) throws SQLException {
		scholarDAO.updateScholarStaffStu(scholarStaffVO);
		scholarDAO.updateScholarStaffTutionAmount(scholarStaffVO);
	}

	@Override
	public void removeScholarStaffStu(ScholarStaffVO scholarStaffVO) throws SQLException {
		scholarDAO.DeleteScholarStaffStu(scholarStaffVO);

	}

	@Override
	public Map<String, Object> selectScholar(SearchCriteria cri, String student_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<ScholarVO> scList = scholarDAO.selectScholar(cri, student_no);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(scList.get(0).getTotalcnt());

		dataMap.put("scList", scList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

}
