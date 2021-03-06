package kr.ac.hs.dao.applicant;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.applicant.StaffApplicantVO;

public class StaffApplicantDAOImpl implements StaffApplicantDAO{
	private SqlSession session;
	private String namespace = "StaffApplicant-Mapper.";
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<StaffApplicantVO> selectApplicantDeptStaff(Map<String, Object> dataMap) throws SQLException {
		
		SearchCriteria cri = (SearchCriteria) dataMap.get("cri");
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<StaffApplicantVO> applicantDeptList = session.selectList(namespace + "selectApplicantDeptStaff", dataMap, rowBounds);
		return applicantDeptList;
	}
	
	@Override
	public int selectApplicantDeptListCount(Map<String, Object> dataMap) throws SQLException {
		int count = session.selectOne(namespace + "selectApplicantDeptListCount", dataMap);
		return count;
	}

	@Override
	public List<StaffApplicantVO> selectApplicant(Map<String, Object> dataMap) throws SQLException {
		
		SearchCriteria cri = (SearchCriteria) dataMap.get("cri");
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<StaffApplicantVO> applicantList = session.selectList(namespace + "selectApplicant", dataMap, rowBounds);
		return applicantList;
	}

	@Override
	public int selectApplicantListCount(Map<String, Object> dataMap) throws SQLException {
		int count = session.selectOne(namespace + "selectApplicantListCount", dataMap);
		return count;
	}

	@Override
	public StaffApplicantVO selectApplicantDetail(String applicant_no) throws SQLException {
		StaffApplicantVO applicantVO = session.selectOne(namespace + "selectApplicantDetail", applicant_no);
		return applicantVO;
	}

	@Override
	public void updatetApplicantPassOrFail(StaffApplicantVO staffApplicantVO) throws SQLException {
		session.update(namespace + "updatetApplicantPassOrFail", staffApplicantVO);
		
	}

	@Override
	public void updateApplicantPassDelete(String applicant_no) throws SQLException {
		session.update(namespace + "updateApplicantPassDelete", applicant_no);
	}

	@Override
	public void insertApplicantToAccount(String applicant_no) throws SQLException {
		session.update(namespace + "insertApplicantToAccount", applicant_no );
	}

	@Override
	public void insertApplicantToStudent(String applicant_no) throws SQLException {
		session.update(namespace + "insertApplicantToStudent", applicant_no );
		
	}


	
}
