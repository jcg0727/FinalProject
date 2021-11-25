package kr.ac.hs.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.Criteria;
import kr.ac.hs.command.PageMaker;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dao.AcademicFreshmenDAO;
import kr.ac.hs.dto.AcademicFreshmenVO;

public class AcademicFreshmenServiceImpl implements AcademicFreshmenService {
	private AcademicFreshmenDAO academicFreshmenDAO;
	
	public void setAcademicFreshmenDAO(AcademicFreshmenDAO academicFreshmenDAO) {
		this.academicFreshmenDAO = academicFreshmenDAO;
	}
	
	@Override
	public String selectDept_nmByStaff_no(String staff_no) throws SQLException {
		String deptName = academicFreshmenDAO.SelectDept_nmByStaff_no(staff_no);
		return deptName;
	}
	
	@Override
	public List<AcademicFreshmenVO> getInfoByStaff_no(String staff_no) throws SQLException {
	    List<AcademicFreshmenVO> stuInfoList = academicFreshmenDAO.SelectItemsByStaff_no(staff_no);
		return stuInfoList;
	}

	@Override
	public List<AcademicFreshmenVO> getInfoByStaff_no(String staff_no, Criteria cri) throws SQLException {
		List<AcademicFreshmenVO> stuInfoList = academicFreshmenDAO.SelectItemsByStaff_no(staff_no,cri);
		return stuInfoList;
	}

	@Override
	public Map<String, Object> getInfoByStaff_no(String staff_no, SearchCriteria cri) throws SQLException {
		Map<String, Object>dataMap = new HashMap<String, Object>();
		
		PageMaker pageMaker = new PageMaker();
		cri.setPerPageNum(10);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(academicFreshmenDAO.selectSearchItemsByStaff_noCount(staff_no, cri));
		
		List<AcademicFreshmenVO> stuInfoList = academicFreshmenDAO.SelectItemsByStaff_no(staff_no, cri);
		
		dataMap.put("stuInfoList", stuInfoList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public List<AcademicFreshmenVO> selectDetailByStudent_no(String student_no) throws SQLException {
		List<AcademicFreshmenVO> infoList = academicFreshmenDAO.SelectDetailByStudent_no(student_no);
		return infoList;
	}

	
	
	@Override
	public List<AcademicFreshmenVO> selectProfessorListByDept_nm(String dept_nm) throws SQLException {
		List<AcademicFreshmenVO> proList = academicFreshmenDAO.SelectProfessorListByDept_nm(dept_nm);
		return proList;
	}

	@Override
	public List<AcademicFreshmenVO> selectProfessorListByDept_nm(String dept_nm, Criteria cri) throws SQLException {
		List<AcademicFreshmenVO> proList = academicFreshmenDAO.SelectProfessorListByDept_nm(dept_nm,cri);
		return proList;
	}

	@Override
	public Map<String, Object> selectProfessorListByDept_nm(String dept_nm, SearchCriteria cri) throws SQLException {
		Map<String, Object>dataMap = new HashMap<String, Object>();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(academicFreshmenDAO.selectCountProfessorListByDept_nm(dept_nm, cri));
		
		List<AcademicFreshmenVO> proList = academicFreshmenDAO.SelectProfessorListByDept_nm(dept_nm,cri);
		
		dataMap.put("proList", proList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public void updateAdvisor(String pro_no, String student_no) throws SQLException {
		academicFreshmenDAO.updateAdvisor(pro_no, student_no);
	}

	@Override
	public void insertAdvisor(String pro_no, String student_no) throws SQLException {
		academicFreshmenDAO.insertAdvisor(pro_no, student_no);
		
	}

}
