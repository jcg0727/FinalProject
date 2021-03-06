package kr.ac.hs.controller.common;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.hs.dto.AccountVO;
import kr.ac.hs.dto.common.AnnounceVO;
import kr.ac.hs.dto.common.AttachVO;
import kr.ac.hs.dto.common.MenuVO;
import kr.ac.hs.service.AccountService;
import kr.ac.hs.service.SmsService;
import kr.ac.hs.service.common.AnnounceService;
import kr.ac.hs.service.common.AttatchmentService;
import kr.ac.hs.service.common.MenuService;
import kr.ac.hs.util.GetAttachesAsMultipartFiles;

@Controller
public class CommonController {

	@Autowired
	private MenuService menuService;

	@Autowired
	private AccountService accountService;

	@Autowired
	private SmsService smsService;

	@Autowired
	private AttatchmentService attachService;

	@Autowired
	private AnnounceService announceService;

	@Resource(name = "uploadFile")
	private String uploadPath;

	@RequestMapping("/index")
	public String index(@RequestParam(defaultValue = "M000000") String mCode, Model model, HttpSession session)
			throws Exception {
		String url = "common/indexPage";

		AccountVO account = (AccountVO) session.getAttribute("loginUser");
		try {
			List<MenuVO> menuList = menuService.getMainMenuList(account.getAuthority_cd());
			for (MenuVO menuVO : menuList) {
				List<MenuVO> subMenuList = menuService.getSubMenuList(menuVO.getMcode(), account.getAuthority_cd());
				menuVO.setSubMenuList(subMenuList);
			}

			for (MenuVO menuVO : menuList) {
				for (MenuVO subMenu : menuVO.getSubMenuList()) {
					List<MenuVO> twoDepthList = menuService.getSubMenuList(subMenu.getMcode(),
							account.getAuthority_cd());
					subMenu.setSubMenuList(twoDepthList);
				}
			}

			MenuVO menu = menuService.getMenuByMcode(mCode, account.getAuthority_cd());

			// + announce
			String account_no = account.getAccount_no();
			List<AnnounceVO> announceList = announceService.selectAnnounce(account_no);
			int count = announceService.selectNewAnnounceCount(account_no);

			model.addAttribute("count", count);
			model.addAttribute("announceList", announceList);
			model.addAttribute("menuList", menuList);
			model.addAttribute("menu", menu);

		} catch (Exception e) {
			e.printStackTrace();
			url = null;
			throw e;
		}

		return url;
	}

	@RequestMapping("/subMenu")
	@ResponseBody
	public ResponseEntity<List<MenuVO>> subMenu(@RequestParam(defaultValue = "M000000") String mCode,
			String authority_cd) throws Exception {
		ResponseEntity<List<MenuVO>> entity = null;

		try {
			List<MenuVO> subMenuList = menuService.getSubMenuList(mCode, authority_cd);
			entity = new ResponseEntity<List<MenuVO>>(subMenuList, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<MenuVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return entity;
	}

	@RequestMapping("/mainPage")
	public String mainPage() {
		String url = "common/mainPage";
		return url;
	}

	@RequestMapping(value = "/getMcode", method = RequestMethod.GET)
	public ResponseEntity<MenuVO> getMcode(String mName) throws Exception {
		ResponseEntity<MenuVO> entity = null;
		try {
			MenuVO menu = menuService.getMenuByMname(mName);
			entity = new ResponseEntity<MenuVO>(menu, HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<MenuVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}

	@RequestMapping(value = "/common/loginForm", method = RequestMethod.GET)
	public String loginForm(@RequestParam(defaultValue = "") String error, HttpServletResponse response) {
		String url = "common/loginForm";
		if (error.equals("1")) {
			response.setStatus(302);
		}
		return url;
	}

	@RequestMapping(value = "/securityModifyForm", method = RequestMethod.GET)
	public String securityModifyForm(String id, Model model, HttpSession session) throws Exception {
		String url = "common/securityModify";

		// AccountVO account = accountService.getAccount(id);

		AccountVO account = (AccountVO) session.getAttribute("loginUser");
		model.addAttribute("account", account);

		return url;
	}

	@RequestMapping(value = "securityModify", method = RequestMethod.POST)
	public String updateSecurityLevel(AccountVO account, int chk_info, HttpSession session, String account_no,
			String acc) throws Exception {
		String url = "common/securityModifySuccess";

		AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");

		loginUser.setSecurity_level(chk_info);
		accountService.updateSecurityLevel(loginUser);

		// if(loginUser !=null && account.getId().equals(loginUser.getId())) {
		// session.setAttribute("loginUser", loginUser);
		// }
		//
		return url;
	}

	@RequestMapping(value = "/smsForm")
	public String smsForm() throws Exception {
		return "common/smsForm";
	}

	@RequestMapping(value = "/message", method = RequestMethod.POST)
	@ResponseBody
	public String sendSMS(String phoneNum) throws Exception {
		Random rand = new Random();
		String numStr = "";
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}
		smsService.certifiedPhoneNumber(phoneNum, numStr);

		return numStr;
	}

	@RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<String>> fileUpload(MultipartFile[] uploadFile) throws Exception {
		ResponseEntity<List<String>> entity = null;
		ArrayList<String> tempList = new ArrayList<>();

		List<AttachVO> fileList = GetAttachesAsMultipartFiles.save(uploadFile, uploadPath);

		for (AttachVO attach : fileList) {
			String tempId = attachService.regist(attach);
			tempList.add(tempId);
		}

		entity = new ResponseEntity<List<String>>(tempList, HttpStatus.OK);
		return entity;
	}

	@RequestMapping(value = "/getFile", method = { RequestMethod.GET, RequestMethod.POST })
	public String getFile(String attach_no, Model model) throws Exception {
		String url = "downloadFile";

		AttachVO attach = attachService.getAttach(attach_no);

		String fileName = attach.getPath();
		fileName = fileName.substring(uploadPath.length() + 1);

		model.addAttribute("fileName", fileName);
		model.addAttribute("savedPath", uploadPath);

		return url;
	}

	@RequestMapping("/common/loginTimeOut")
	public String loginTimeOut(Model model) throws Exception {
		String url = "security/sessionOut";
		model.addAttribute("message", "????????? ?????????????????????.\\n ?????? ????????? ?????????!");
		return url;
	}

	@RequestMapping("/common/userCheck")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> userCheck(AccountVO account) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		HashMap<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("id", account.getId());
		dataMap.put("pwd", account.getPwd());

		try {
			AccountVO user = accountService.selectSecurityLevel(account);
			int returnLev = 99;
			if (user != null) {
				returnLev = user.getSecurity_level();
				dataMap.put("returnLev", returnLev);
			}

			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return entity;
	}

	/* ???????????? ?????? ??? */
	@RequestMapping(value = "/modifyPwForm", method = RequestMethod.GET)
	public String modifyPwForm(String id, Model model, HttpSession session) {
		String url = "common/modifyPwForm";

		AccountVO account = (AccountVO) session.getAttribute("loginUser");
		model.addAttribute("account", account);

		return url;
	}

	/* ???????????? ?????? */
	@RequestMapping(value = "modifyPw", method = RequestMethod.POST)
	public String modifyPw(AccountVO account, Model model, String newPwd2, String nowPwd, String newPwd,
			HttpSession session, String account_no) throws Exception {
		String urlSuccess = "common/modifyPwSuccess";
		String urlFail = "common/modifyPwFail";
		String urlNotEquals = "common/modifyPwNotEquals";

		AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");

		if (nowPwd.equals(loginUser.getPwd())) {
			if (newPwd.equals(newPwd2)) {
				loginUser.setPwd(newPwd);
				accountService.updatePw(loginUser);
				session.invalidate();
				return urlSuccess;
			} else {
				return urlNotEquals;

			}
		} else {
			System.out.println("pwd:" + nowPwd);
			System.out.println("newPwd:" + newPwd);
			return urlFail;
		}

	}

	/* ????????? ?????? ??? */
	@RequestMapping(value = "/idFindForm")
	public String idFindForm() throws Exception {
		String url = "common/idFindForm";

		return url;

	}

	/* ????????? ?????? */
	@RequestMapping(value = "idFind", method = RequestMethod.POST)
	public String idFind(AccountVO account, Model model) throws Exception {
		AccountVO accountVO = accountService.getId(account);

		if (accountVO == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("userId", accountVO.getStudent_no());
		}

		return "common/idFindForm";

	}

	/* ?????? ?????? ??? */
	@RequestMapping(value = "/pwFindForm")
	public String pwFindForm() throws Exception {
		String url = "common/pwFindForm";

		return url;

	}

	@RequestMapping(value = "/pwFind", method = RequestMethod.POST)
	public void findPw(@ModelAttribute AccountVO account, HttpServletResponse response) throws Exception {
		accountService.findPw(response, account);
	}

	@RequestMapping("/updateToY")
	@ResponseBody
	public ResponseEntity<String> updateAnno_noToY(String anno_no) throws Exception {
		System.out.println("anno_no" + anno_no);
		ResponseEntity<String> entity = null;
		try {
			announceService.updateAnno_noToY(anno_no);
			entity = new ResponseEntity<String>(HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping("/intervalAnnounce")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> intervalAnnounce(HttpSession session) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		AccountVO account = (AccountVO) session.getAttribute("loginUser");
		try {
			int count = announceService.selectNewAnnounceCount(account.getAccount_no());
			List<AnnounceVO> announceList = announceService.selectAnnounce(account.getAccount_no());
			
			dataMap.put("count", count);
			dataMap.put("announceList", announceList);
			
			entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

}
