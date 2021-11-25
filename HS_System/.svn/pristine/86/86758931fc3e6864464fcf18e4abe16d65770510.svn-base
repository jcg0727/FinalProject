package kr.ac.hs.service.notice;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.Criteria;
import kr.ac.hs.command.PageMaker;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.notice.NoticeCommand;
import kr.ac.hs.dao.notice.NoticeDAO;
import kr.ac.hs.dto.notice.NoticeVO;

public class NoticeServiceImpl implements NoticeService {
	
	private NoticeDAO noticeDAO;
	
	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}
	

	@Override
	public List<NoticeVO> selectNoticeY() throws SQLException {
		List<NoticeVO> noticeList = noticeDAO.selectNoticeY();
		return noticeList;
	}

	@Override
	public Map<String, Object> selectNoticeN(SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		PageMaker pageMaker = new PageMaker();
		cri.setPerPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(noticeDAO.selectNoticeNSearchCount(cri));
		
		List<NoticeVO> noticeList = noticeDAO.selectNoticeN(cri);
		dataMap.put("noticeList", noticeList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}


	@Override
	public void insertNotice(NoticeVO notice) throws SQLException {
		noticeDAO.insertNotice(notice);
	}


	@Override
	public void insertAttach(String notice_no,int attach_order ,String attach_no) throws SQLException {
		
		noticeDAO.insertAttach(notice_no, attach_order,attach_no);
		System.out.println(notice_no + "--------------------------------------  " + attach_no);
	}


	@Override
	public String selectNotice_no() throws SQLException {
		String notice_no = noticeDAO.selectNotice_no();
		return notice_no;
	}


	@Override
	public NoticeVO selectAllByNotice_no(String notice_no) throws SQLException {
		NoticeVO notice = noticeDAO.selectAllByNotice_no(notice_no);
		noticeDAO.increaseViewCnt(notice_no);
		return notice;
	}


	@Override
	public NoticeVO selectAllByNotice_no2(String notice_no) throws SQLException {
		NoticeVO notice = noticeDAO.selectAllByNotice_no(notice_no);
		return notice;
	}


	@Override
	public List<NoticeVO> selectAttach_noByNotice_no(String notice_no) throws SQLException {
		List<NoticeVO> attachList = noticeDAO.selectAttach_noByNotice_no(notice_no);
		return attachList;
	}


	@Override
	public void updateNotice(NoticeVO notice) throws SQLException {
		noticeDAO.updateNotice(notice);
	}


	@Override
	public void deleteNotice_attach(String attach_no) throws SQLException {
		noticeDAO.deleteNotice_attach(attach_no);
	}


	@Override
	public void deleteNotice(String notice_no) throws SQLException {
		List<NoticeVO> attachList = noticeDAO.selectAttach_noByNotice_no(notice_no);
		for(NoticeVO attach_no : attachList) {
			noticeDAO.deleteNotice_attach(attach_no.getAttach_no());
		}
		noticeDAO.deleteNotice(notice_no);
	}






}
