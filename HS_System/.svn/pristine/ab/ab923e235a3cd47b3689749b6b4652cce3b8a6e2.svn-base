package kr.ac.hs.util;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import kr.ac.hs.dto.PictureVO;

public class MakeFileName {
	
	public static String toUUIDFileName(String fileName, String delimiter) {
		String uuid = UUID.randomUUID().toString().replace("-", "");
		return uuid + delimiter + fileName;
	}
	
	public static String parseFileNameFromUUID(String fileName, String delimiter) {
		String[] uuidFileName = fileName.split(delimiter);
		return uuidFileName[uuidFileName.length - 1];
	}	
	

	public static List<PictureVO> parseFileNameFromAttaches(List<PictureVO> attachList,
																	String delimiter) {

		List<PictureVO> renamedAttachList = new ArrayList<PictureVO>();
		
		if(attachList!=null) {
			for (PictureVO attach : attachList) {
				String fileName = attach.getFileName(); // DB상의 fileName
				fileName = parseFileNameFromUUID(fileName, delimiter); // uuid가 제거된
																		// fileName
				attach.setFileName(fileName);
	
				renamedAttachList.add(attach);
			}
		}
		return renamedAttachList;
	}
	
}
