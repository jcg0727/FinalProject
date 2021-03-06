package kr.ac.hs.service.graduation;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.Criteria;
import kr.ac.hs.command.PageMaker;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dao.graduation.GraduationDAO;
import kr.ac.hs.dto.graduation.GraduationVO;

public class GraduationServiceImpl implements GraduationService {

	private GraduationDAO graduationDAO;
	
	public void setGraduationDAO(GraduationDAO graduationDAO) {
		this.graduationDAO = graduationDAO;
	}
	
	@Override
	public Map<String, Object> selectGraduationPointsbyStudent_no(String student_no) throws SQLException {
		int jp = graduationDAO.selectJPbyStudent_no(student_no);
		int js = graduationDAO.selectJSbyStudent_no(student_no);
		int gp = graduationDAO.selectGPbyStudent_no(student_no);
		int gs = graduationDAO.selectGSbyStudent_no(student_no);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("jp", jp);
		dataMap.put("js", js);
		dataMap.put("gp", gp);
		dataMap.put("gs", gs);
		
		return dataMap;
	}

	@Override
	public void insertGrad_thesis(String student_no, String attach_no) throws SQLException {
		graduationDAO.insertGrad_thesis(student_no, attach_no);
	}

	@Override
	public List<GraduationVO> selectFilenameStatusByStudent_no(String student_no) throws SQLException,NumberFormatException {
		List<GraduationVO> list = graduationDAO.selectFilenameStatusByStudent_no(student_no);
		return list;
	}

	@Override
	public void removeFromGrad_thesis(String student_no) throws SQLException {
		graduationDAO.removeFromGrad_thesis(student_no);
		
	}

	@Override
	public void removeFromGraduated(String student_no) throws SQLException {
		graduationDAO.removeFromGraduated(student_no);
		
	}

	@Override
	public void removeFromAttachment(String attach_no) throws SQLException {
		graduationDAO.removeFromAttachment(attach_no);
	}
	
	@Override
	public void insertGraduated(String student_no) throws SQLException {
		graduationDAO.insertGraduated(student_no);
		
	}

	@Override
	public List<GraduationVO> selectThesisByPro_no(String pro_no) throws SQLException {
		List<GraduationVO> thesisList = graduationDAO.selectThesisByPro_no(pro_no);
		return thesisList;
	}

	@Override
	public List<GraduationVO> selectThesisByPro_no(String pro_no, Criteria cri) throws SQLException {
		List<GraduationVO> thesisList = graduationDAO.selectThesisByPro_no(pro_no, cri);
		return thesisList;
	}

	@Override
	public Map<String, Object> selectThesisByPro_no(String pro_no, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String,Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(graduationDAO.selectThesisByPro_noSearchCount(pro_no, cri));
		
		List<GraduationVO> thesisList = graduationDAO.selectThesisByPro_no(pro_no, cri);
		
		dataMap.put("thesisList", thesisList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public void updateWhenProfConfirm(String student_no) throws SQLException {
		graduationDAO.updateStatus_cdOnGrad_thesis(student_no);
		// ???????????? 8??? 20???, 2??? 20???
		
		// ????????????
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		System.out.println("int year"+year);
		String month = "02";
		String now_month = now.getMonth().toString();
		System.out.println("now_month" + now_month);
		if(now_month.equals("SEPTEMBER")||now_month.equals("OCTOBER")||now_month.equals("NOVEMBER")||now_month.equals("DECEMBER")||now_month.equals("JANUARY")||now_month.equals("FEBRUARY")) {
			year = year+1;
		}else if(now_month.equals("MARCH")||now_month.equals("APRIL")||now_month.equals("MAY")||now_month.equals("JUNE")||now_month.equals("JULY")||now_month.equals("AUGUST")) {
			month = "08";
		}
		
		String graduate_date = Integer.toString(year) + month + "20";
		
		graduationDAO.updateStatus_cdOnGraduated(student_no, graduate_date);
	}

	@Override
	public String selectAccount_no(String student_no) throws SQLException {
		String account_no = graduationDAO.selectAccount_no(student_no);
		return account_no;
	}

	@Override
	public GraduationVO selectGraduatedByStudent_no(String student_no) throws SQLException {
		GraduationVO graduation = graduationDAO.selectGraduatedByStudent_no(student_no);
		return graduation;
	}

	@Override
	public void updatePostpone(String student_no, String graduate_date) throws SQLException {
		graduationDAO.updatePostpone(graduate_date, student_no);
	}



}
