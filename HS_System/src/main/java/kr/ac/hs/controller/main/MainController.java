package kr.ac.hs.controller.main;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.notice.NoticeCommand;
import kr.ac.hs.command.notice.NoticeModifyCommand;
import kr.ac.hs.dto.AccountVO;
import kr.ac.hs.dto.common.AttachVO;
import kr.ac.hs.dto.notice.NoticeVO;
import kr.ac.hs.service.common.AttatchmentService;
import kr.ac.hs.service.notice.NoticeService;
import kr.ac.hs.util.GetAttachesAsMultipartFiles;

@Controller
public class MainController {

	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private AttatchmentService attachService;
	
	@Resource(name = "uploadFile")
	private String uploadPath;
	
	@RequestMapping("/main")
	public ModelAndView main(ModelAndView mnv, SearchCriteria cri, HttpSession session)throws SQLException{
		String url = "main/main";
		
		AccountVO account = (AccountVO) session.getAttribute("loginUser");
		String authority = account.getAuthority_cd();
		
		List<NoticeVO> YList =  noticeService.selectNoticeY();
		Map<String, Object> dataMap = noticeService.selectNoticeN(cri);
		
		mnv.addObject("authority", authority);
		mnv.addObject("YList", YList);
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("target", cri.getSearchType2());
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/registForm")
	public String registForm(){
		String url="main/noticeRegist";		
		return url;
	}
	
	@RequestMapping(value="/regist", method = RequestMethod.POST)
	public String regist(NoticeCommand regReq, HttpServletRequest request,RedirectAttributes rttr
			,HttpSession session)throws Exception{
		String url="redirect:/registForm";
		NoticeVO notice = regReq.toVO();
		
		AccountVO account = (AccountVO)session.getAttribute("loginUser");
		String account_no = account.getAccount_no();
		
		notice.setAccount_no(account_no);
		String notice_no = noticeService.selectNotice_no();
		notice.setNotice_no(notice_no);
		
		noticeService.insertNotice(notice);
		
		MultipartFile[] uploadFile =  regReq.getUploadFile();
		
		
		List<AttachVO> fileList = GetAttachesAsMultipartFiles.save(uploadFile, uploadPath);
		String attach_no = null;
		int attach_order = 0;
		for (AttachVO attach : fileList) {
			attach_order++;
			attachService.regist(attach);
			attach_no = attach.getAttach_no();
			noticeService.insertAttach(notice_no,attach_order,attach_no);
		}
				
		rttr.addFlashAttribute("from","regist");
		
		return url;
	}
	

	@RequestMapping("/detail")
	public ModelAndView detail(String notice_no, String from, ModelAndView mnv, HttpSession session ) throws Exception {
		String url = "main/noticeDetail";
		AccountVO account = (AccountVO) session.getAttribute("loginUser");
		String account_no = account.getAccount_no();
		
		NoticeVO notice = null;
		if (from != null && from.equals("list")) {
			 notice = noticeService.selectAllByNotice_no(notice_no);
			url = "redirect:/detail.do?notice_no=" + notice_no;
		} else {
			notice = noticeService.selectAllByNotice_no2(notice_no);
		}
		// 필요한거 ! attach_no, attach_name
		List<NoticeVO> attach_noList = noticeService.selectAttach_noByNotice_no(notice_no);//attach_no리스트
		List<AttachVO> attachList = new ArrayList<AttachVO>();
		for(NoticeVO attach_no : attach_noList) {
		
			attachList.add(attachService.getAttach(attach_no.getAttach_no()));	
		}
		
		mnv.addObject("account_no", account_no);
		mnv.addObject("notice", notice);
		//mnv.addObject("attach_noList", attach_noList); //attach_no리스트
		mnv.addObject("attachList", attachList);
		mnv.setViewName(url);

		return mnv;
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(String notice_no, ModelAndView mnv) throws Exception{
		String url = "main/noticeModify";
		NoticeVO notice = noticeService.selectAllByNotice_no2(notice_no);

		List<NoticeVO> attach_noList = noticeService.selectAttach_noByNotice_no(notice_no);//attach_no리스트
		List<AttachVO> attachList = new ArrayList<AttachVO>();
		for(NoticeVO attach_no : attach_noList) {
		
			attachList.add(attachService.getAttach(attach_no.getAttach_no()));	
		}
		mnv.addObject("attachList", attachList);	
		mnv.addObject("notice", notice);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/modify")
	public String modify(NoticeModifyCommand modifyReq, HttpServletRequest request, RedirectAttributes rttr)throws Exception{
		String url = "redirect:/detail.do";
		if(modifyReq.getDeleteFile() != null && modifyReq.getDeleteFile().length>0) {
			for(String attach_no : modifyReq.getDeleteFile()) {
				AttachVO attach = attachService.getAttach(attach_no);
				String num = attach.getAttach_no();
				noticeService.deleteNotice_attach(num);
			}
		}
		//파일 저장
		MultipartFile[] uploadFile =  modifyReq.getUploadFile();
		List<AttachVO> fileList = GetAttachesAsMultipartFiles.save(uploadFile, uploadPath);
		
		String attach_no = null;
		int attach_order = 0;
		for (AttachVO attach : fileList) {
			attach_order++;
			attachService.regist(attach);
			attach_no = attach.getAttach_no();
			noticeService.insertAttach(modifyReq.getNotice_no(),attach_order,attach_no);
		}
		NoticeVO notice = modifyReq.toVO();
		
		noticeService.updateNotice(notice);
		rttr.addFlashAttribute("from", "modify");
		rttr.addAttribute("notice_no", notice.getNotice_no());
		
		return url;
	}
	
	@RequestMapping("/remove")
	public String delete(String notice_no, RedirectAttributes rttr)throws Exception {
		String url = "redirect:/detail.do";
		noticeService.deleteNotice(notice_no);
		rttr.addFlashAttribute("from", "remove");
		rttr.addAttribute("notice_no", notice_no);
		return url;
	}
	
}
