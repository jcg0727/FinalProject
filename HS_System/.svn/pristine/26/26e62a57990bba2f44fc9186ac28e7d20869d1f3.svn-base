package kr.ac.hs.service.academic;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.Criteria;
import kr.ac.hs.command.PageMaker;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dao.academic.StaffAcademicStateDAO;
import kr.ac.hs.dto.AcademicStateVO;
import kr.ac.hs.dto.academic.AcademicStateStaffVO;

public class StaffAcademicStateServiceImpl implements StaffAcademicStateService {
	private StaffAcademicStateDAO stuAcademicStateDAO;
	
	public void setStaffAcademicStateDAO(StaffAcademicStateDAO stuAcademicStateDAO) {
		this.stuAcademicStateDAO = stuAcademicStateDAO;
	}
	
	//  공통 --------------
	// 상세조회
	@Override
	public AcademicStateStaffVO getDetail(String student_no, String register_date) throws SQLException {
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("student_no", student_no);
		dataMap.put("register_date", register_date);
		
		AcademicStateStaffVO acdm = stuAcademicStateDAO.selectDetailByStudenNoAndRegisterDate(dataMap);
		return acdm;
		
	}
	
	// 승인
		@Override
		public void modifyStatus(AcademicStateStaffVO academicState) throws SQLException {
			stuAcademicStateDAO.updateStatus(academicState);
			
		}
	
	// ------------------ 학과교직원 -----------------------------------------------------------

	// 학과명 가져오기
	@Override
	public String getDeptStaffNmByStaff_no(String staff_no) throws SQLException {
		String deptName = stuAcademicStateDAO.selectDeptStaffNmByStaff_no(staff_no);
		return deptName;
	}
	
	// 학적변동이력조회
	@Override
	public List<AcademicStateVO> getDeptStaffAcademicState(String staff_no) throws SQLException {
		List<AcademicStateVO> deptStuStatusList = stuAcademicStateDAO.selectDeptStaffAcademicState(staff_no);
		return deptStuStatusList;
	}
	
	// 검색 조건
	@Override
	public List<AcademicStateVO> getDepStaffAcademicStateCriteria(String staff_no, Criteria cri) throws SQLException {
		List<AcademicStateVO> deptStuStatusList = stuAcademicStateDAO.selectDepStaffAcademicStateCriteria(staff_no, cri);
		return deptStuStatusList;
	}

	@Override
	public Map<String, Object> getDepStaffAcademicStateCriteria(String staff_no, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(stuAcademicStateDAO.selectSearchDepStaff_noCount(staff_no, cri));
		
		List<AcademicStateVO> deptStuStatusList = stuAcademicStateDAO.selectDepStaffAcademicStateCriteria(staff_no, cri);
		
		dataMap.put("deptStuStatusList", deptStuStatusList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	

	// ------------------ 교무처 -----------------------------------------------------------
	
	// 학적변동이력조회
	@Override
	public List<AcademicStateVO> getStaffAcademicState() throws SQLException {
		List<AcademicStateVO> stuStatusList = stuAcademicStateDAO.selectStaffAcademicState();
		return stuStatusList;
	}
	// 검색 조건
	@Override
	public List<AcademicStateVO> getStaffAcademicStateCriteria(Criteria cri) throws SQLException {
		List<AcademicStateVO> stuStatusList = stuAcademicStateDAO.selectStaffAcademicStateCriteria(cri);
		return stuStatusList;
	}

	@Override
	public Map<String, Object> getStaffAcademicStateCriteria(SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(stuAcademicStateDAO.selectSearchStaff_noCount(cri));
		
		List<AcademicStateVO> stuStatusList = stuAcademicStateDAO.selectStaffAcademicStateCriteria(cri);
		
		dataMap.put("stuStatusList", stuStatusList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}




	
}
