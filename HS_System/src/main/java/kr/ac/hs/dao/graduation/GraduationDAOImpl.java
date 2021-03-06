package kr.ac.hs.dao.graduation;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.command.Criteria;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.graduation.GraduationVO;

public class GraduationDAOImpl implements GraduationDAO {
	
    private SqlSession session;
    public void setSqlSession(SqlSession session){
       this.session=session;
    }

	@Override
	public int selectJPbyStudent_no(String student_no) throws SQLException {
		int jp = session.selectOne("selectJPbyStudent_no", student_no);
		return jp;
	}

	@Override
	public int selectJSbyStudent_no(String student_no) throws SQLException {
		int js = session.selectOne("selectJSbyStudent_no", student_no);
		return js;
	}

	@Override
	public int selectGPbyStudent_no(String student_no) throws SQLException {
		int gp = session.selectOne("selectGPbyStudent_no", student_no);
		return gp;
	}

	@Override
	public int selectGSbyStudent_no(String student_no) throws SQLException {
		int gs = session.selectOne("selectGSbyStudent_no", student_no);
		return gs;
	}

	@Override
	public void insertGrad_thesis(String student_no, String attach_no) throws SQLException {
		Map<String, Object>dataMap = new HashMap<String, Object>();
		dataMap.put("student_no", student_no);
		dataMap.put("attach_no", attach_no);
		session.insert("insertGrad_thesis", dataMap);
	}

	@Override
	public List<GraduationVO> selectFilenameStatusByStudent_no(String student_no) throws SQLException {
		List<GraduationVO> list = session.selectList("selectFilenameStatusByStudent_no", student_no);
		return list;
	}

	@Override
	public void removeFromGrad_thesis(String student_no) throws SQLException {
		session.delete("removeFromGrad_thesis", student_no);
		
	}

	@Override
	public void removeFromGraduated(String student_no) throws SQLException {
		session.delete("removeFromGraduated",student_no);
		
	}

	@Override
	public void removeFromAttachment(String attach_no) throws SQLException {
		session.delete("removeFromAttachment",attach_no);
	}
	
	@Override
	public void insertGraduated(String student_no) throws SQLException {
		session.insert("insertGraduated", student_no);
		
	}

	@Override
	public List<GraduationVO> selectThesisByPro_no(String pro_no) throws SQLException {
		List<GraduationVO> thesisList = session.selectList("selectThesisByPro_no", pro_no);
		return thesisList;
	}

	@Override
	public List<GraduationVO> selectThesisByPro_no(String pro_no, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<GraduationVO> thesisList = session.selectList("selectThesisByPro_no", pro_no, rowBounds);
		return thesisList;
	}

	@Override
	public List<GraduationVO> selectThesisByPro_no(String pro_no, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		Map<String,Object> dataMap = new HashMap<String, Object>();
		dataMap.put("pro_no", pro_no);
		dataMap.put("cri", cri);
		
		List<GraduationVO> thesisList = session.selectList("selectThesisByPro_noSearch", dataMap, rowBounds);
		return thesisList;
	}

	@Override
	public int selectThesisByPro_noSearchCount(String pro_no, SearchCriteria cri) throws SQLException {
		int count = 0;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		dataMap.put("pro_no", pro_no);
		dataMap.put("cri", cri);
		
		count = session.selectOne("selectThesisByPro_noSearchCount", dataMap);
		
		return count;
	}

	@Override
	public void updateStatus_cdOnGrad_thesis(String student_no) throws SQLException {
		session.update("updateStatus_cdOnGrad_thesis", student_no);
		
	}

	@Override
	public void updateStatus_cdOnGraduated(String student_no, String graduate_date) throws SQLException {
		Map<String,Object> dataMap = new HashMap<String, Object>();
		dataMap.put("student_no", student_no);
		dataMap.put("graduate_date", graduate_date);
		session.update("updateStatus_cdOnGraduated", dataMap);
		
	}

	@Override
	public String selectAccount_no(String student_no) throws SQLException {
		String account_no = session.selectOne("selectAccount_no", student_no);
		return account_no;
	}

	@Override
	public GraduationVO selectGraduatedByStudent_no(String student_no) throws SQLException {
		GraduationVO graduation = session.selectOne("selectGraduatedByStudent_no", student_no);
		return graduation;
	}

	@Override
	public void updatePostpone(String graduate_date, String student_no) throws SQLException {
		Map<String,Object> dataMap = new HashMap<String, Object>();
		dataMap.put("student_no", student_no);
		dataMap.put("graduate_date", graduate_date);
		session.update("updatePostpone", dataMap);
		
	}

}
