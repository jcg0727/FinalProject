package kr.ac.hs.dao.academic;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.command.Criteria;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.AcademicStateVO;
import kr.ac.hs.dto.academic.AcademicStateStaffVO;

public class StaffAcademicStateDAOImpl implements StaffAcademicStateDAO{

	private SqlSession session;
	private String namespace = "StaffAcademicState-Mapper.";

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	// ------------------ 공통 -----------------------------------------------------------

	// 학생 정보 상세보기
	@Override
	public AcademicStateStaffVO selectDetailByStudenNoAndRegisterDate(Map<String, Object>dataMap) throws SQLException {
		AcademicStateStaffVO acdm = session.selectOne(namespace + "selectDetailByStudenNoAndRegisterDate", dataMap);
		return acdm;
	}
	
	// 승인
	@Override
	public void updateStatus(AcademicStateStaffVO academicState) throws SQLException {
		session.update(namespace + "updatetStatus", academicState);
	}
	
	
	// ------------------ 학과교직원 -----------------------------------------------------------
	// 학과명 가져오기
	@Override
	public String selectDeptStaffNmByStaff_no(String staff_no) throws SQLException {
		String dept_nm = session.selectOne(namespace + "selectDept_nmByStaffNo", staff_no);
		return dept_nm;
	}
	
	// 학적변동이력조회
	@Override
	public List<AcademicStateVO> selectDeptStaffAcademicState(String staff_no) throws SQLException {
		List<AcademicStateVO> deptStaffList = session.selectList(namespace + "selectDeptStaffAcademicState", staff_no); 
		return deptStaffList;
	}

	@Override
	public List<AcademicStateVO> selectDepStaffAcademicStateCriteria(String staff_no, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<AcademicStateVO> deptStaffList = session.selectList(namespace + "selectDeptStaffAcademicState", staff_no, rowBounds); 
		return deptStaffList;
	}

	@Override
	public List<AcademicStateVO> selectDepStaffAcademicStateCriteria(String staff_no, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("staff_no", staff_no);
		dataMap.put("cri", cri);
		
		List<AcademicStateVO> deptStaffList = session.selectList(namespace + "selectDepStaffAcademicStateCriteria", dataMap, rowBounds); 
		
		for(AcademicStateVO vo : deptStaffList) {
			System.out.println(vo.getStaff_no());
		}
		return deptStaffList;
	}

	@Override
	public int selectSearchDepStaff_noCount(String staff_no, SearchCriteria cri) throws SQLException {
		int count = 0;
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("staff_no", staff_no);
		dataMap.put("cri", cri);
		
		count = session.selectOne(namespace + "selectSearchDeptStaffCount", dataMap); 
		System.out.println("count: " + count);

		return count;
	}


	// ------------------ 교무처 -----------------------------------------------------------
	@Override
	public List<AcademicStateVO> selectStaffAcademicState() throws SQLException {
		List<AcademicStateVO> StaffList = session.selectList(namespace + "selectDeptStaffAcademicState"); 
		return StaffList;
	}

	@Override
	public List<AcademicStateVO> selectStaffAcademicStateCriteria(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<AcademicStateVO> StaffList = session.selectList(namespace + "selectStaffAcademicState", rowBounds); 
		return StaffList;
	}

	@Override
	public List<AcademicStateVO> selectStaffAcademicStateCriteria(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("cri", cri);
		
		List<AcademicStateVO> StaffList = session.selectList(namespace + "selectStaffAcademicStateCriteria", dataMap, rowBounds); 
		
		for(AcademicStateVO vo : StaffList) {
			System.out.println(vo.getStaff_no());
		}
		return StaffList;
	}

	@Override
	public int selectSearchStaff_noCount(SearchCriteria cri) throws SQLException {
		int count = 0;
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("cri", cri);
		
		count = session.selectOne(namespace + "selectSearchStaffCount", dataMap); 
		return count;
	}


}