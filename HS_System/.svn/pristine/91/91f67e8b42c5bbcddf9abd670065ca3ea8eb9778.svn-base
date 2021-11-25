package kr.ac.hs.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.DepartmentVO;

public class DepartmentDAOImpl implements DepartmentDAO {

	private SqlSession session;
	private String namespace = "Department-Mapper.";

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	// 학과명검색
	@Override
	public DepartmentVO selectDepartmentByDepartmentName(String dept_nm) throws SQLException {
		DepartmentVO department = session.selectOne(namespace + "selectDepartmentByDepartmentName", dept_nm);
		return department;
	}

	@Override
	public DepartmentVO selectDepartmentByDeptartmentCode(String dept_cd) throws SQLException {
		DepartmentVO department = session.selectOne(namespace + "selectDepartmentByDeptartmentCode", dept_cd);
		return department;
	}

	@Override
	public List<DepartmentVO> selectDepartment(SearchCriteria cri) throws SQLException {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<DepartmentVO> deptList = session.selectList(namespace + "selectDepartment", cri, rowBounds);
		return deptList;
	}

	// 학과 등록
	@Override
	public void insertDepartment(DepartmentVO department) throws SQLException {
		session.update(namespace + "insertDepartment", department);

	}

	// 학과수정
	@Override
	public void updateDepartment(DepartmentVO department) throws SQLException {
		session.update(namespace + "updateDepartment", department);

	}

	@Override
	public int selectCountDepartment() throws SQLException {
		int count = session.selectOne(namespace + "selectCountDepartment");
		return count;
	}

	// 검색페이징포함 학과명목록
	@Override
	public List<DepartmentVO> selectDepartmentSearch(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("cri", cri);

		List<DepartmentVO> departList = session.selectList(namespace + "selectDepartmentSearch", cri, rowBounds);

		return departList;
	}

	// 검색페이징포함 학부명목록
	@Override
	public List<DepartmentVO> selectFacultySearch(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("cri", cri);

		List<DepartmentVO> facultyList = session.selectList(namespace + "selectFacultySearch", cri, rowBounds);

		return facultyList;
	}

	@Override
	public List<DepartmentVO> selectDepartmentDetail(String dept_nm) throws SQLException {
		List<DepartmentVO> departDetail = session.selectList(namespace + "selectDepartmentDetail", dept_nm);
		return departDetail;
	}

}
