package kr.ac.hs.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.command.Criteria;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.AcademicFreshmenVO;

public class AcademicFreshmenDAOImpl implements AcademicFreshmenDAO {
	
    private SqlSession session;
    public void setSqlSession(SqlSession session){
       this.session=session;
    }
    
	@Override
	public String SelectDept_nmByStaff_no(String staff_no) throws SQLException {
		String dept_nm = session.selectOne("selectDept_nmByStaff_no", staff_no);
		return dept_nm;
	}

	@Override
	public List<AcademicFreshmenVO> SelectItemsByStaff_no(String staff_no) throws SQLException {
		List<AcademicFreshmenVO> stuInfoList = session.selectList("selectItemsByStaff_no", staff_no);
		return stuInfoList;
	}

	@Override
	public List<AcademicFreshmenVO> SelectItemsByStaff_no(String staff_no, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<AcademicFreshmenVO> stuInfoList = session.selectList("selectItemsByStaff_no", staff_no, rowBounds);
		return stuInfoList;
	}

	@Override
	public List<AcademicFreshmenVO> SelectItemsByStaff_no(String staff_no, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		Map<String,Object> dataMap = new HashMap<String, Object>();
		dataMap.put("staff_no", staff_no);
		dataMap.put("cri", cri);
		
		List<AcademicFreshmenVO> stuInfoList = session.selectList("Freshmen-Mapper.selectSearchItemsByStaff_no", dataMap ,rowBounds);
		
		for (AcademicFreshmenVO vo : stuInfoList) {
			System.out.println(vo.getPhone());
		}
		
		return stuInfoList;
	}

	@Override
	public int selectSearchItemsByStaff_noCount(String staff_no, SearchCriteria cri) throws SQLException {
		int count = 0;
		
		Map<String,Object> dataMap = new HashMap<String, Object>();
		dataMap.put("staff_no", staff_no);
		dataMap.put("cri", cri);
		
		count = session.selectOne("selectSearchItemsByStaff_noCount", dataMap);
		System.out.println("count: " + count);
		return count;
	}

	@Override
	public List<AcademicFreshmenVO> SelectDetailByStudent_no(String student_no) throws SQLException {
		List<AcademicFreshmenVO> infoList = session.selectList("Freshmen-Mapper.selectDetailByStudent_no", student_no);
		
		return infoList;
	}

	@Override
	public List<AcademicFreshmenVO> SelectProfessorListByDept_nm(String dept_nm) throws SQLException {
		List<AcademicFreshmenVO> proList = session.selectList("Freshmen-Mapper.selectProfessorListByDept_nm", dept_nm);
		
		return proList;
	}

	@Override
	public List<AcademicFreshmenVO> SelectProfessorListByDept_nm(String dept_nm, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<AcademicFreshmenVO> proList = session.selectList("Freshmen-Mapper.selectProfessorListByDept_nm", dept_nm, rowBounds);
		return proList;
	}

	@Override
	public List<AcademicFreshmenVO> SelectProfessorListByDept_nm(String dept_nm, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		Map<String,Object> dataMap = new HashMap<String, Object>();
		dataMap.put("dept_nm", dept_nm);
		dataMap.put("cri", cri);
		
		List<AcademicFreshmenVO> proList = session.selectList("Freshmen-Mapper.selectSearchProfessorListByDept_nm", dataMap ,rowBounds);
		
		return proList;
	}

	@Override
	public int selectCountProfessorListByDept_nm(String dept_nm, SearchCriteria cri) throws SQLException {
		int count = 0;
		
		Map<String,Object> dataMap = new HashMap<String, Object>();
		dataMap.put("dept_nm", dept_nm);
		dataMap.put("cri", cri);
		
		count = session.selectOne("Freshmen-Mapper.selectCountProfessorListByDept_nm", dataMap);
		return count;
	}

	@Override
	public void updateAdvisor(String pro_no, String student_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String,Object>();
		dataMap.put("pro_no", pro_no);
		dataMap.put("student_no", student_no);
		
		session.update("Freshmen-Mapper.updateAdvisor", dataMap);
		
	}

	@Override
	public void insertAdvisor(String pro_no, String student_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String,Object>();
		dataMap.put("pro_no", pro_no);
		dataMap.put("student_no", student_no);
		
		session.insert("Freshmen-Mapper.insertAdvisor", dataMap);
	}


	




}
