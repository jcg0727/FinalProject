package kr.ac.hs.service.counsel;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.PageMaker;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dao.counsel.Counsel2DAO;
import kr.ac.hs.dto.common.Counsel2VO;

public class Counsel2ServiceImpl implements Counsel2Service {

	private Counsel2DAO counsel2DAO;
	public void setCounsel2DAO(Counsel2DAO counsel2DAO) {
		this.counsel2DAO = counsel2DAO;
	}
	
	@Override
	public Map<String, Object> selectAllByStudent_no(String student_no, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		PageMaker pageMaker = new PageMaker();
		cri.setPerPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(counsel2DAO.selectAllByStudent_noCount(student_no, cri));
		
		List<Counsel2VO> councelList = counsel2DAO.selectAllByStudent_no(student_no, cri);
		dataMap.put("counselList", councelList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public void insertCounsel(Counsel2VO counsel) throws SQLException {
		counsel.setCounsel_no(counsel2DAO.selectCounsel_no());
		String categ_nm = null;
		categ_nm = counsel.getConsl_categ_nm();
		String categ_cd = null;
		
		if (categ_nm.equals("일반상담")) {
			categ_cd = "CCDI001";
		}else if(categ_nm.equals("전과상담")) {
			categ_cd = "CCDI002";
		}else if(categ_nm.equals("복수전공상담")) {
			categ_cd = "CCDI003";
		}else if(categ_nm.equals("자퇴상담")) {
			categ_cd = "CCDI004";
		}
		counsel.setConsl_categ_cd(categ_cd);
		
		counsel2DAO.insertCounsel(counsel);
	}

	@Override
	public Map<String, Object> selectAllByPro_no(String pro_no, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		PageMaker pageMaker = new PageMaker();
		cri.setPerPageNum(8);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(counsel2DAO.selectAllByPro_noCount(pro_no, cri));
		
		List<Counsel2VO> councelList = counsel2DAO.selectAllByPro_no(pro_no, cri);
		dataMap.put("counselList", councelList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public void updateAccept(String counsel_no) throws SQLException {
		counsel2DAO.updateAccept(counsel_no);
	}

	@Override
	public void updateDeny(String counsel_no) throws SQLException {
		counsel2DAO.updateDeny(counsel_no);
	}

	@Override
	public void updateRefuse_content(String refuse_content, String counsel_no) throws SQLException {
		counsel2DAO.updateRefuse_content(refuse_content, counsel_no);
	}

	@Override
	public String selectAccount_noByStudent_no(String student_no) throws SQLException {
		String account_no = counsel2DAO.selectAccount_noByStudent_no(student_no);
		return account_no;
	}

	@Override
	public List<Counsel2VO> detailList(String counsel_no) throws SQLException {
		List<Counsel2VO> detailList = counsel2DAO.selectDetailByCounsel_no(counsel_no);
		return detailList;
	}

	@Override
	public void updateCounselContent(Counsel2VO counsel2) throws SQLException {
		counsel2DAO.updateCounselContent(counsel2);
		
	}

}
