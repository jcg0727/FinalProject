package kr.ac.hs.dao.notice;

import java.sql.SQLException;
import java.util.List;

import kr.ac.hs.command.Criteria;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.notice.NoticeVO;

public interface NoticeDAO {

	List<NoticeVO> selectNoticeY()throws SQLException;
	
/*	List<NoticeVO> selectNoticeN()throws SQLException;
	List<NoticeVO> selectNoticeN(Criteria cri)throws SQLException;*/
	List<NoticeVO> selectNoticeN(SearchCriteria cri)throws SQLException;
	
	int selectNoticeNSearchCount(SearchCriteria cri)throws SQLException;
	
	String selectNotice_no()throws SQLException;
	void insertNotice(NoticeVO notice)throws SQLException;
	
	void insertAttach(String notice_no,int attach_order ,String attach_no)throws SQLException;
	
	NoticeVO selectAllByNotice_no(String notice_no)throws SQLException;
	
	void increaseViewCnt(String notice_no)throws SQLException;
	
	List<NoticeVO> selectAttach_noByNotice_no(String notice_no)throws SQLException;
	
	void updateNotice(NoticeVO notice)throws SQLException;
	
	void deleteNotice_attach(String attach_no)throws SQLException;
	
	void deleteNotice(String notice_no)throws SQLException;
}
