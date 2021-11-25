package kr.ac.hs.dao.counsel;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.common.Counsel2VO;

public class Counsel2DAOImpl implements Counsel2DAO {

    private SqlSession session;
    public void setSqlSession(SqlSession session){
       this.session=session;
    }
    
	@Override
	public List<Counsel2VO> selectAllByStudent_no(String student_no, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("cri", cri);
		dataMap.put("student_no", student_no);
		
		List<Counsel2VO> counselList = session.selectList("Counsel2-Mapper.selectAllByStudent_noSearch",dataMap,rowBounds);
		return counselList;
	}

	@Override
	public int selectAllByStudent_noCount(String student_no, SearchCriteria cri) throws SQLException {
		int count = 0;
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("student_no", student_no);
		dataMap.put("cri", cri);
		
		count = session.selectOne("Counsel2-Mapper.selectAllByStudent_noCount", dataMap);
		return count;
	}
	@Override
	public String selectCounsel_no() throws SQLException {
		String counsel_no = session.selectOne("Counsel2-Mapper.selectCounsel_no");
		return counsel_no;
	}

	@Override
	public void insertCounsel(Counsel2VO counsel) throws SQLException {
		session.insert("Counsel2-Mapper.insertCounsel", counsel);
	}

	@Override
	public List<Counsel2VO> selectAllByPro_no(String pro_no, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("cri", cri);
		dataMap.put("pro_no", pro_no);
		
		List<Counsel2VO> counselList = session.selectList("Counsel2-Mapper.selectAllByPro_noSearch",dataMap,rowBounds);
		return counselList;
	}

	@Override
	public int selectAllByPro_noCount(String pro_no, SearchCriteria cri) throws SQLException {
		int count = 0;
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("pro_no", pro_no);
		dataMap.put("cri", cri);
		
		count = session.selectOne("Counsel2-Mapper.selectAllByPro_noCount", dataMap);
		return count;
	}

	@Override
	public void updateAccept(String counsel_no) throws SQLException {
		session.update("Counsel2-Mapper.updateAccept", counsel_no);
	}

	@Override
	public void updateDeny(String counsel_no) throws SQLException {
		session.update("Counsel2-Mapper.updateDeny", counsel_no);
	}

	@Override
	public void updateRefuse_content(String refuse_content, String counsel_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String,Object>();
		dataMap.put("refuse_content", refuse_content);
		dataMap.put("counsel_no", counsel_no);
		session.update("Counsel2-Mapper.updateRefuse_content", dataMap);
	}

	@Override
	public String selectAccount_noByStudent_no(String student_no) throws SQLException {
		String account_no = session.selectOne("Counsel2-Mapper.selectAccount_noByStudent_no", student_no);
		return account_no;
	}

	@Override
	public List<Counsel2VO> selectDetailByCounsel_no(String counsel_no) throws SQLException {
		List<Counsel2VO> detailList = session.selectList("Counsel2-Mapper.selectDetailByCounsel_no", counsel_no);
		return detailList;
	}

	@Override
	public void updateCounselContent(Counsel2VO counsel2) throws SQLException {
		session.update("Counsel2-Mapper.updateCounselContent", counsel2);
		
	}


}
