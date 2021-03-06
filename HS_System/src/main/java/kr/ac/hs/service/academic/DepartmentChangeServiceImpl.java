package kr.ac.hs.service.academic;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;

import com.sun.org.apache.bcel.internal.generic.IF_ACMPEQ;

import kr.ac.hs.command.PageMaker;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.academic.DepartmentChangeStaffListCommand;
import kr.ac.hs.dao.DepartmentDAO;
import kr.ac.hs.dao.StudentDAO;
import kr.ac.hs.dao.academic.DepartmentChageDAO;
import kr.ac.hs.dao.common.CounselDAO;
import kr.ac.hs.dao.common.ProfessorDAO;
import kr.ac.hs.dao.grades.GradesDAO;
import kr.ac.hs.dto.DepartmentVO;
import kr.ac.hs.dto.ProfessorVO;
import kr.ac.hs.dto.academic.DepartmentChangeVO;
import kr.ac.hs.dto.academic.DepartmentchangeAttachVO;
import kr.ac.hs.dto.academic.StudentVO;
import kr.ac.hs.dto.common.AdvisorVO;
import kr.ac.hs.dto.common.CounselSelectVO;
import kr.ac.hs.dto.common.CounselVO;

public class DepartmentChangeServiceImpl implements DepartmentChangeService {

	private DepartmentChageDAO deptDAO;
	private CounselDAO counselDAO;
	private StudentDAO studentDAO;
	private DepartmentDAO departmentDAO;
	private ProfessorDAO professorDAO;
	private GradesDAO gradesDAO;

	public void setGradesDAO(GradesDAO gradesDAO) {
		this.gradesDAO = gradesDAO;
	}

	public void setProfessorDAO(ProfessorDAO professorDAO) {
		this.professorDAO = professorDAO;
	}

	public void setDeptDAO(DepartmentChageDAO deptDAO) {
		this.deptDAO = deptDAO;
	}

	public void setDepartmentChageDAO(DepartmentChageDAO departmentChageDAO) {
		this.deptDAO = departmentChageDAO;
	}

	public void setCounselDAO(CounselDAO counselDAO) {
		this.counselDAO = counselDAO;
	}

	public void setStudentDAO(StudentDAO studentDao) {
		this.studentDAO = studentDao;
	}

	public void setDepartmentDAO(DepartmentDAO departmentDAO) {
		this.departmentDAO = departmentDAO;
	}

	@Override
	public String regist(DepartmentChangeVO dept, CounselVO counsel, String[] files) throws SQLException {

		List<DepartmentChangeVO> deptList = deptDAO.selectDepartmentChangeByStundentNO(dept.getStudent_no());

		for (DepartmentChangeVO deptVO : deptList) {
			String status = deptVO.getStatus_cd();
			if (!status.equals("CCDH005")) {
				return "NO";
			}
		}

		String student_no = dept.getStudent_no();
		StudentVO student = studentDAO.selectStudentByStudentNo(student_no);
		List<AdvisorVO> professor = studentDAO.selectAdvisorByStudnetNo(student_no);
		AdvisorVO advisor = null;
		if(professor != null && professor.size() != 0) {
			advisor = professor.get(0);
		}
		String sequence = counselDAO.selectCounselSequence();
		DepartmentVO apply = departmentDAO.selectDepartmentByDepartmentName(dept.getApply_dept_nm());
		DepartmentVO belong = departmentDAO.selectDepartmentByDeptartmentCode(student.getDept_cd());

		counsel.setCounsel_no(sequence);
		counsel.setRegister_content(dept.getRegister_reason());
		counsel.setConsl_categ_cd("CCDI002");
		counsel.setStudent_no(student_no);
		counsel.setPro_no(advisor.getPro_no());
		counsel.setConsl_categ_nm("????????????");

		counselDAO.insertCounsel(counsel);

		dept.setBelong_dept_cd(student.getDept_cd());
		dept.setCounsel_no(counsel.getCounsel_no());
		dept.setBelong_dept_nm(belong.getDept_nm());
		dept.setApply_dept_cd(apply.getDept_cd());

		deptDAO.insertDepartmentChange(dept);

		for (String file : files) {
			DepartmentchangeAttachVO attach = new DepartmentchangeAttachVO();
			attach.setAttach_no(file);
			attach.setDelete_whether("N");
			attach.setRegister_date(dept.getRegister_date());
			attach.setStudent_no(student_no);

			deptDAO.insertDepartmentChangeAttach(attach);
		}

		return "OK";
	}

	@Override
	public List<DepartmentChangeVO> getListByStudentNO(String student_no) throws SQLException {
		List<DepartmentChangeVO> deptList = deptDAO.selectDepartmentChangeByStundentNO(student_no);
		return deptList;
	}

	@Override
	public Map<String, Object> getTransferListByDeptNO(Map<String, Object> dataMap) throws SQLException {

		List<DepartmentChangeVO> deptList = deptDAO.selectDepartmentChangeByBelongDepartmentNO(dataMap);
		int totalCount = deptDAO.selectCountDepartmentChange(dataMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();

		PageMaker pageMaker = new PageMaker();

		SearchCriteria cri = (DepartmentChangeStaffListCommand) dataMap.get("cri");

		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		resultMap.put("deptChangeList", deptList);
		resultMap.put("pageMaker", pageMaker);
		return resultMap;
	}

	@Override
	public void modify(DepartmentChangeVO dept) throws SQLException {
		switch (dept.getStatus_cd()) {
		case "CCDH001":
			dept.setStatus_nm("????????????");
			break;
		case "CCDH002":
			dept.setStatus_nm("??????????????????");
			break;
		case "CCDH003":
			dept.setStatus_nm("??????????????????");
			break;
		case "CCDH004":
			dept.setStatus_nm("????????????????????????");
			break;
		case "CCDH005":
			dept.setStatus_nm("??????????????????");
			break;
		case "CCDH006":
			dept.setStatus_nm("??????");
			break;
		}

		deptDAO.updateDpartmentChange(dept);
	}

	
	
	@Override
	public void remove(DepartmentChangeVO dept) throws SQLException {
		deptDAO.deleteDepartmentChange(dept);
		counselDAO.deleteCounselByCounselNo(dept.getCounsel_no());
	}

	@Override
	public Map<String, Object> getDetail(String student_no, String register_date) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		dataMap.put("student_no", student_no);
		dataMap.put("register_date", register_date);

		DepartmentChangeVO dept = deptDAO.seletDetailByStudentNoAndRgisterDate(dataMap);
		StudentVO student = studentDAO.selectStudentByStudentNo(student_no);
		double grades = gradesDAO.selectPreviousSemesterGradesByStudnetNo(student_no);
		CounselSelectVO counsel = counselDAO.selectCounselByCounselNo(dept.getCounsel_no());
		ProfessorVO professor = professorDAO.selectProfessorbyProNo(counsel.getPro_no());

		resultMap.put("deptChange", dept);
		resultMap.put("student", student);
		resultMap.put("counsel", counsel);
		resultMap.put("professor", professor);
		resultMap.put("grades", grades);

		return resultMap;
	}

	@Override
	public void modifyCounselByDeptChangeSetCounsel(DepartmentChangeVO dept) {
		deptDAO.updateDpartmentChangeByStaffForTransfer(dept);
	}
}
