package com.boys.fishing.board.service;

import org.apache.tools.ant.types.FileList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boys.fishing.board.dao.BoardDAO;
import com.boys.fishing.board.dto.SumsumDTO;

@Service
public class BoardService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired BoardDAO dao;
	
	public ModelAndView qna() {
		ModelAndView mav = new ModelAndView();
		ArrayList<HashMap<String, String>> qnaList = dao.qna();
		/*
		 * for (HashMap<String, String> hashMap : qnaList) { String regdate =
		 * hashMap.get("Q_REGDATE"); hashMap.replace("Q_REGDATE",
		 * regdate.substring(regdate.lastIndexOf(" "))); }
		 */
		mav.addObject("QNAList",qnaList);
		mav.setViewName("QNA");
		return mav;
	}

	public String QNAwrite(SumsumDTO dto, RedirectAttributes attr) {
		String page = "redirect:/qna";
		String msg = "QNA 등록에 실패했습니다.";
		if(dao.QNAwrite(dto)>0) {
			msg = "QNA 등록에 성공했습니다.";
		}
		attr.addFlashAttribute("msg",msg);
		return page;
	}

	
	
	//섬섬톡 글쓰기
	@Transactional
	public String someWrite(SumsumDTO dto, ArrayList<String> fileList) {
		logger.info("글쓰기 서비스 진입");
		String page = "redirect:/someWriteForm";
		if(dao.someWrite(dto)>0) {
			page = "redirect:/someTalk";			
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fileList", fileList);
		map.put("b_num", Integer.toString(dto.getB_num()));
		if(fileList != null) {
			dao.someImgUpload(map);	
		}
		return page;
	}

	public ModelAndView someTalkList(String sel) {
		ModelAndView mav = new ModelAndView();
		ArrayList<SumsumDTO> list = dao.someTalkList(sel);
		mav.setViewName("someTalk");
		mav.addObject("list",list);
		return mav;
	}

	public ModelAndView someWriteForm() {
		ModelAndView mav = new ModelAndView();
		ArrayList<String> fishList = dao.fish();
		mav.setViewName("someWriteForm");
		mav.addObject("fishList", fishList);
		return mav;
	}

	public ModelAndView fileUpload(MultipartFile file, HttpSession session) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("uploadForm");
		String fileName = file.getOriginalFilename();
		String newFileName = System.currentTimeMillis() + fileName.substring(fileName.lastIndexOf("."));

		try {
			byte[] bytes = file.getBytes();
			Path filePath = Paths.get("C:/upload/" + newFileName);
			Files.write(filePath, bytes);
			String path = "/photo/" + newFileName;

			mav.addObject("path", path);

			ArrayList<String> fileList = (ArrayList<String>) session.getAttribute("fileList");
			fileList.add(newFileName); //fileName = oriFileName
			logger.info("업로드된 파일 수 : " + fileList.size());
			session.setAttribute("fileList", fileList);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return mav;
	}

	
	public HashMap<String, Object> fileDelete(String fileName, HttpSession session) {
		boolean success = false;
		HashMap<String, Object> map = new HashMap<String, Object>();
		File delFile = new File("C:/upload/" + fileName);

		if (delFile.exists()) {
			success = delFile.delete();
		}
		if (success) {
			ArrayList<String> fileList = (ArrayList<String>) session.getAttribute("fileList");
			Iterator<String> itr = fileList.iterator();
			while(itr.hasNext()) {
				if(itr.next().equals(fileName)) {
					itr.remove();
				}
			}
			logger.info("업로드된 파일 수 : " + fileList.size());
			session.setAttribute("fileList", fileList);
		}
		logger.info("file delete success : " + success);
		map.put("success", success);

		return map;
	}
	
	
	

}
