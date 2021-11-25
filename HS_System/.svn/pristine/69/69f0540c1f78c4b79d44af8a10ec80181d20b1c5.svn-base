package kr.ac.hs.service.academic;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.PageMaker;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.academic.PluralMajorStaffCommand;
import kr.ac.hs.dao.DepartmentDAO;
import kr.ac.hs.dao.StudentDAO;
import kr.ac.hs.dao.academic.PluralMajorDAO;
import kr.ac.hs.dao.common.CounselDAO;
import kr.ac.hs.dto.academic.PluralMajorVO;

public class PluralMajorSerivceImpl implements PluralMajorService {

	private PluralMajorDAO pluralDAO;
	public void setPluralMajorDAO(PluralMajorDAO pluralDAO) {
		this.pluralDAO = pluralDAO;
	}
	
	private CounselDAO counselDAO;
	public void setCounselDAO(CounselDAO counselDAO) {
		this.counselDAO = counselDAO;
	}
	
	private StudentDAO studentDAO;
	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}
	
	private DepartmentDAO departmentDAO;
	public void setDepartmentDAO(DepartmentDAO departmentDAO) {
		this.departmentDAO = departmentDAO;
	}
	
	@Override
	//public String regist(PluralMajorVO pluralMajor, CounselVO counsel) throws SQLException {
	public String regist(PluralMajorVO pluralMajor) throws SQLException {
		List<PluralMajorVO> pluralList = pluralDAO.selectPluralMajorByStudentNO(pluralMajor.getStudent_no());
		
		for(PluralMajorVO pluralVO : pluralList) {
			String status = pluralVO.getStatus_cd();
			if(!status.equals("CCDH005")) {
				return "NO";
			}
		}
//		
//		String student_no = pluralMajor.getStudent_no();
//		StudentVO student = studentDAO.selectStudentByStudentNo(student_no);
//		List<AdvisorVO> professor = studentDAO.selectAdvisorByStudnetNo(student_no);
//		AdvisorVO advisor = professor.get(0);
//		String sequence = counselDAO.selectCounselSequence();
//		DepartmentVO apply = departmentDAO.selectDepartmentByDepartmentName(pluralMajor.getApply_deptnm());
//		DepartmentVO belong = departmentDAO.selectDepartmentByDeptartmentCode(student.getDept_cd());
//		
//		counsel.setCounsel_no(sequence);
//		counsel.setConsl_categ_cd("CCDI003");
//		counsel.setStudent_no(student_no);
//		counsel.setPro_no(advisor.getPro_no());
		
//		counselDAO.insertCounsel(counsel);
//		
//		pluralMajor.setDept_cd(student.getDept_cd());
//		pluralMajor.setCounsel_no(counsel.getCounsel_no());
//		pluralMajor.setDept_nm("경영학과");
//		pluralMajor.setApply_deptcd(apply.getDept_cd());
		pluralDAO.insertPluralMajor(pluralMajor);
		
		return "OK";
		
	}

	@Override
	public List<PluralMajorVO> getListByStudentNO(String student_no) throws SQLException {
		List<PluralMajorVO> pluralList = pluralDAO.selectPluralMajorByStudentNO(student_no);
		return pluralList;
	}

	@Override
	public void remove(String student_no) throws SQLException {
		pluralDAO.deletePlural(student_no);
		
	}

	@Override
	public List<PluralMajorVO> selectStudentInfoByPlural(String student_no) throws SQLException {
		List<PluralMajorVO> pluralList = pluralDAO.selectStudentInfoByPlural(student_no);
		
		return pluralList;

}

	@Override
	public Map<String, Object> selectTotal(String student_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<PluralMajorVO> pluralList = pluralDAO.selectPluralMajorByStudentNO(student_no);
		List<PluralMajorVO> stuInfo = pluralDAO.selectStudentInfoByPlural(student_no);
		
		dataMap.put("pluralList", pluralList);
		dataMap.put("stuInfo", stuInfo);
		return dataMap;
	}

	@Override
	public Map<String, Object> selectPluralByStaffDeptnm(Map<String,Object> dataMap) throws SQLException {
		List<PluralMajorVO> pluralList = pluralDAO.selectPluralByStaffDeptnm(dataMap);
		int totalCount = pluralDAO.selectCountPluralMajor(dataMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		PageMaker pageMaker = new PageMaker();
		SearchCriteria cri = (PluralMajorStaffCommand) dataMap.get("cri");
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		resultMap.put("pluralList", pluralList);
		resultMap.put("pageMaker", pageMaker);
		
		return resultMap;
	}

	@Override
	public Map<String,Object> selectStudentByApplyStaffDeptnm(Map<String,Object> dataMap) throws SQLException {
		List<PluralMajorVO> pluralList = pluralDAO.selectStudentByApplyStaffDeptnm(dataMap);
		int totalCount = pluralDAO.selectCountPluralMajor(dataMap);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		PageMaker pageMaker = new PageMaker();
		SearchCriteria cri = (PluralMajorStaffCommand) dataMap.get("cri");
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		resultMap.put("pluralList", pluralList);
		resultMap.put("pageMaker", pageMaker);
		
		return resultMap;
	}

	@Override
	public PluralMajorVO selectStudentDetailByStudentNo(String student_no) throws SQLException {
		PluralMajorVO plural = pluralDAO.selectStudentDetailByStudentNo(student_no);
		return plural;
	}
}
