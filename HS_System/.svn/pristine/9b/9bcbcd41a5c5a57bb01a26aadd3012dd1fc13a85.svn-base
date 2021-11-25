package kr.ac.hs.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.hs.dto.common.AttachVO;


public class GetAttachesAsMultipartFiles {
	
	public static void main(String[] args) {
		String file = "untitled.exerd";
		
		int index = file.indexOf(".exerd");
		
		System.out.println(file.substring(0,index));
	}

	public static List<AttachVO> save(MultipartFile[] multiFiles, String savePath) throws Exception {
		ArrayList<AttachVO> attachList = new ArrayList<AttachVO>();

		if(multiFiles != null) {
			for (MultipartFile multi : multiFiles) {
			AttachVO attach = new AttachVO();
			String originalFilename = multi.getOriginalFilename();
			String fileName = MakeFileName.toUUIDFileName(originalFilename, "$$");
			String extension = multi.getOriginalFilename();
			extension = extension.substring(extension.lastIndexOf("."));
			
			
			File target = new File(savePath, fileName);
			
			target.mkdirs();
			
			multi.transferTo(target);

			attach.setAttach_size(multi.getSize());
			
			originalFilename = originalFilename.substring(0, originalFilename.indexOf(extension));

			attach.setPath(savePath+"\\"+fileName);
			
			extension = extension.toUpperCase();
			attach.setExtension(extension);
			attach.setOrginal_nm(originalFilename);
			attach.setTemp_storage("N");
			attach.setUnit("KB");
			
			attachList.add(attach);
		}
	}
		return attachList;
	}
}
