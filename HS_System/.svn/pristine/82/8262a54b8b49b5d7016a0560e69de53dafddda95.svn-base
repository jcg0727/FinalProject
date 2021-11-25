package kr.ac.hs.controller.tuition;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sun.mail.iap.Response;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.scholar.TuitionrCommand;
import kr.ac.hs.dto.AccountVO;
import kr.ac.hs.dto.scholar.ScholarStaffVO;
import kr.ac.hs.dto.tuition.TuitionVO;
import kr.ac.hs.service.scholar.ScholarService;
import kr.ac.hs.service.tuition.TuitionService;

@Controller
public class Tuitionontroller {

	@Autowired
	private TuitionService service;
	
	@Autowired
	private ScholarService scService;

	@RequestMapping("/tuition/pay")
	public ModelAndView TutionMain(ModelAndView mnv, HttpSession session, SearchCriteria cri, String account_no) throws SQLException {
		String url = "scholar/student/tuitionStudent";

		AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
		account_no = loginUser.getStudent_no();
		List<TuitionVO> tuitionList = service.getTuitionList(loginUser.getId());
		Map<String, Object> dataMap2 = scService.selectScholar(cri, account_no);

		mnv.addObject("tuitionList", tuitionList);
		mnv.addObject("dataMap2", dataMap2);
		mnv.setViewName(url);

		return mnv;

	}

	@RequestMapping(value = "/tuition//printBill", method = RequestMethod.GET)
	public ModelAndView Detail(ModelAndView mnv, TuitionrCommand cmd) throws Exception {
		String url = "scholar/student/tuitionBillPrint";

		TuitionVO vo = cmd.toDetailTuition();

		List<TuitionVO> tuitionDetailList = service.getTuitionDetail(vo);
		mnv.addObject("tuitionDetailList", tuitionDetailList);
		mnv.setViewName(url);

		return mnv;

	}

	@RequestMapping(value = "/tuition/printCheck", method = RequestMethod.GET)
	public ModelAndView DetailCheck(ModelAndView mnv, TuitionrCommand cmd) throws Exception {
		String url = "scholar/student/tuitionCheckPrint";

		TuitionVO vo = cmd.toDetailTuition();

		List<TuitionVO> tuitionDetailList = service.getTuitionDetail(vo);
		mnv.addObject("tuitionDetailList", tuitionDetailList);
		mnv.setViewName(url);

		return mnv;

	}

	@RequestMapping(value = "/tuition/payResult", method = RequestMethod.GET)
	public ResponseEntity<TuitionVO> payMentURL(TuitionrCommand cmd) throws Exception {
		
		ResponseEntity<TuitionVO> entity = null;
		
		TuitionVO vo = cmd.toPayment();
		
/*		System.out.println(vo.getSemester());
		System.out.println(vo.getPayment_amount());
		System.out.println(vo.getStudent_no());*/
		
		try {
			service.modifyPayTuition(vo);
			entity = new ResponseEntity<TuitionVO>(vo, HttpStatus.OK);
		}catch (Exception e) {
			entity = new ResponseEntity<TuitionVO>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
