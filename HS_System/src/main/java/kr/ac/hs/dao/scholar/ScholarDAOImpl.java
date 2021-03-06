package kr.ac.hs.dao.scholar;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.scholar.ScholarStaffVO;
import kr.ac.hs.dto.scholar.ScholarVO;

public class ScholarDAOImpl implements ScholarDAO {

	private SqlSession session;
	private String namespace = "Scholar-Mapper.";

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public String selectDeptNmDeptStaff(String staff_no) throws SQLException {
		String dept_nm = session.selectOne(namespace + "selectDeptNmDeptStaff", staff_no);
		return dept_nm;
	}

	@Override
	public List<ScholarVO> selectStudentDeptStaffScoreList(Map<String, Object> dataMap) throws SQLException {

		SearchCriteria cri = (SearchCriteria) dataMap.get("cri");

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<ScholarVO> deptStaffScoreList = session.selectList(namespace + "selectStudentDeptStaffScoreList", dataMap, rowBounds);

		return deptStaffScoreList;
	}

	@Override
	public void insertDeptStaffScholar(String student_no) throws SQLException {
		session.update(namespace + "insertDeptStaffScholar", student_no);
	}

	@Override
	public void deleteDeptStaffScholarStu(ScholarStaffVO scholarVO) throws SQLException {
		session.update(namespace + "deleteDeptStaffScholarStu", scholarVO);
	}

	@Override
	public List<ScholarVO> selectStudentScholarRecommend(Map<String, Object> dataMap) throws SQLException {
		SearchCriteria cri = (SearchCriteria) dataMap.get("cri");

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();

		RowBounds rowBounds = new RowBounds(offset, limit);
		List<ScholarVO> staffScholarList = session.selectList(namespace + "selectStudentScholarRecommend", dataMap, rowBounds);

		return staffScholarList;
	}

	@Override
	public void updateScholarStaffStu(ScholarStaffVO scholarVO) throws SQLException {
		session.update(namespace + "updateScholarStaffStu", scholarVO);
	}

	@Override
	public void updateScholarStaffTutionAmount(ScholarStaffVO scholarVO) throws SQLException {
		session.update(namespace + "updateScholarStaffTutionAmount", scholarVO);

	}

	@Override
	public void DeleteScholarStaffStu(ScholarStaffVO scholarVO) throws SQLException {
		session.update(namespace + "DeleteScholarStaffStu", scholarVO);
	}

	@Override
	public List<ScholarVO> selectScholar(SearchCriteria cri, String student_no) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("cri", cri);
		dataMap.put("student_no", student_no);

		List<ScholarVO> scList = session.selectList(namespace + "selectScholar", dataMap, rowBounds);
		return scList;
	}

}
