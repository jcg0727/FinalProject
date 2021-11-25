package kr.ac.hs.dao.notice;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.command.Criteria;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.notice.NoticeVO;

public class NoticeDAOImpl implements NoticeDAO {

    private SqlSession session;
    public void setSqlSession(SqlSession session){
       this.session=session;
    }
    
	@Override
	public List<NoticeVO> selectNoticeY() throws SQLException {
		List<NoticeVO> noticeList = session.selectList("selectNoticeY");
		return noticeList;
	}

/*	@Override
	public List<NoticeVO> selectNoticeN() throws SQLException {
		List<NoticeVO> noticeList = session.selectList("selectNoticeN");
		return noticeList;
	}

	@Override
	public List<NoticeVO> selectNoticeN(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<NoticeVO> noticeList = session.selectList("selectNoticeN",rowBounds);
		return noticeList;
	}
*/
	@Override
	public List<NoticeVO> selectNoticeN(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<NoticeVO> noticeList = session.selectList("selectNoticeNSearch", cri, rowBounds);
		return noticeList;
	}

	@Override
	public int selectNoticeNSearchCount(SearchCriteria cri) throws SQLException {
		int count = 0;
		count = session.selectOne("selectNoticeNSearchCount", cri);
		return count;
	}

	@Override
	public String selectNotice_no() throws SQLException {
		String notice_no = session.selectOne("selectNotice_no");
		return notice_no;
	}

	@Override
	public void insertNotice(NoticeVO notice) throws SQLException {
		session.insert("insertNotice", notice);
	}

	@Override
	public void insertAttach(String notice_no,int attach_order ,String attach_no) throws SQLException {
		Map<String, Object>dataMap = new HashMap<String, Object>();
		
		dataMap.put("attach_order", attach_order);
		dataMap.put("notice_no", notice_no);
		dataMap.put("attach_no", attach_no);
		session.insert("insertAttach", dataMap);
		
	}

	@Override
	public NoticeVO selectAllByNotice_no(String notice_no) throws SQLException {
		NoticeVO notice =  session.selectOne("selectAllByNotice_no", notice_no);
		return notice;
	}

	@Override
	public void increaseViewCnt(String notice_no) throws SQLException {
		session.update("increaseViewCnt", notice_no);
	}

	@Override
	public List<NoticeVO> selectAttach_noByNotice_no(String notice_no) throws SQLException {
		List<NoticeVO> attachList = session.selectList("selectAttach_noByNotice_no", notice_no);
		return attachList;
	}

	@Override
	public void updateNotice(NoticeVO notice) throws SQLException {
		session.update("updateNotice", notice);
	}

	@Override
	public void deleteNotice_attach(String attach_no) throws SQLException {
		session.delete("deleteNotice_attach", attach_no);
	}

	@Override
	public void deleteNotice(String notice_no) throws SQLException {
		session.delete("deleteNotice", notice_no);
	}

}
