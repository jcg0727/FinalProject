package kr.ac.hs.service.notice;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.Criteria;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.notice.NoticeVO;

public interface NoticeService {
	
	public List<NoticeVO> selectNoticeY()throws SQLException;
	/*
	public List<NoticeVO> selectNoticeN()throws SQLException;
	public List<NoticeVO> selectNoticeN(Criteria cri)throws SQLException;*/
	Map<String, Object> selectNoticeN(SearchCriteria cri)throws SQLException;
	
	public void insertNotice(NoticeVO notice)throws SQLException;
	public String selectNotice_no()throws SQLException;
	
	public void insertAttach(String notice_no,int attach_order ,String attach_no)throws SQLException;
	
	public NoticeVO selectAllByNotice_no(String notice_no)throws SQLException;
	public NoticeVO selectAllByNotice_no2(String notice_no)throws SQLException;
	
	public List<NoticeVO> selectAttach_noByNotice_no(String notice_no)throws SQLException;
	
	public void updateNotice(NoticeVO notice)throws SQLException;
	
	public void deleteNotice_attach(String attach_no)throws SQLException;
	
	public void deleteNotice(String notice_no)throws SQLException;
	


	
	
}
