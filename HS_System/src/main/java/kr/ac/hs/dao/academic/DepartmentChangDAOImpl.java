package kr.ac.hs.dao.academic;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.academic.DepartmentChangeVO;
import kr.ac.hs.dto.academic.DepartmentchangeAttachVO;
import kr.ac.hs.dto.common.CounselVO;

public class DepartmentChangDAOImpl implements DepartmentChageDAO{
	private SqlSession session;
	private String namespace = "DepartmentChange-Mapper.";
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public void insertDepartmentChange(DepartmentChangeVO dept) throws SQLException {
		session.update(namespace+"insertDepartmentChange", dept);
	}

	@Override
	public List<DepartmentChangeVO> selectDepartmentChangeByStundentNO(String student_no) throws SQLException {
		List<DepartmentChangeVO> deptList = session.selectList(namespace+"selectDepartmentChangeByStundentNO", student_no);
		return deptList;
	}
	
	@Override
	public List<DepartmentChangeVO> selectDepartmentChangeByBelongDepartmentNO(Map<String, Object>dataMap) throws SQLException {
		
		SearchCriteria cri = (SearchCriteria) dataMap.get("cri");
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<DepartmentChangeVO> deptList = session.selectList(namespace+"selectDepartmentChangeByDepartmentNO", dataMap, rowBounds);
		return deptList;
	}
	
	@Override
	public List<DepartmentChangeVO> selectDepartmentChangeByApplyDepartmentNO(Map<String, Object>dataMap) throws SQLException {
		SearchCriteria cri = (SearchCriteria) dataMap.get("cri");
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<DepartmentChangeVO> deptList = session.selectList(namespace+"selectDepartmentChangeByBelongDepartmentNO", dataMap, rowBounds);
		return deptList;
	}
	
	@Override
	public void updateDpartmentChange(DepartmentChangeVO dept) throws SQLException {
		session.update(namespace+"updateDepartmentChangeOfStatus", dept);
	}
	
	@Override
	public void deleteDepartmentChange(DepartmentChangeVO dept) throws SQLException {
		session.update(namespace+"deleteDepartmentChange", dept);
	}
	
	@Override
	public void insertDepartmentChangeAttach(DepartmentchangeAttachVO attach) throws SQLException {
		session.update(namespace+"insertDepartmentChangeAttach", attach);
	}
	
	@Override
	public int selectCountDepartmentChange(Map<String,Object> dataMap) throws SQLException{
		int count = session.selectOne(namespace+"selectCountDepartmentChange", dataMap);
		return count;
	}
	@Override
	public DepartmentChangeVO seletDetailByStudentNoAndRgisterDate(Map<String, Object>dataMap) {
		DepartmentChangeVO dept = session.selectOne(namespace+"seletDetailByStudentNoAndRgisterDate", dataMap);
		return dept;
	}
	@Override
	public void updateDpartmentChangeByStaffForTransfer(DepartmentChangeVO dept) {
		session.update(namespace+"updateDpartmentChangeByStaffForTransfer", dept);
	}
	
}
