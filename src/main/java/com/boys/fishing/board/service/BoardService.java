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
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
		if(fileList != null) {
			for (String file : fileList) {
				dao.someImgUpload(Integer.toString(dto.getB_num()), file);				
			}
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

	public ModelAndView someDetail(String b_num) {
		ModelAndView mav = new ModelAndView();
		SumsumDTO dto = dao.someDetail(b_num);
		mav.setViewName("someDetail");
		mav.addObject("dto",dto);
		return mav;
	}
	
	@Transactional
	public ModelAndView someUpdateForm(String b_num, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		ArrayList<SumsumDTO> list = dao.fileList(b_num);
		ArrayList<String> fileList = new ArrayList<String>();
		for (SumsumDTO item : list){
			fileList.add(item.getBi_name());
		}
		session.setAttribute("fileList", fileList);
		SumsumDTO dto = dao.someDetail(b_num);
		ArrayList<String> fishList = dao.fish();
		mav.setViewName("someUpdate");
		mav.addObject("dto",dto);
		mav.addObject("fishList",fishList);
		return mav;
	}
	
	@Transactional
	public ModelAndView someUpdate(SumsumDTO dto, HttpSession session) {
		ArrayList<String> fileList = (ArrayList<String>) session.getAttribute("fileList");
		dao.fileDel(dto.getB_num());
		for (String string : fileList) {
			dao.someImgUpload(Integer.toString(dto.getB_num()), string)	;
		}
		dao.someUpdate(dto);
		return null;
	}
	
	@Transactional
	public String someDelete(String b_num, RedirectAttributes attr) {

		ArrayList<SumsumDTO> list = dao.fileList(b_num);
		ArrayList<String> fileList = new ArrayList<String>();
		for (SumsumDTO item : list){
			fileList.add(item.getBi_name());
		}
		for (String file : fileList) {
			File delFile = new File("C:/upload/" + file);
			if (delFile.exists()) {
				delFile.delete();
			}			
		}
		dao.fileDel(Integer.parseInt(b_num));
		if(dao.someDelete(b_num)>0) {
			attr.addFlashAttribute("msg","삭제에 성공했습니다.");
		}
		attr.addFlashAttribute("msg","삭제에 실패했습니다.");
		return "redirect:/someTalk";
	}

	public ModelAndView qnaanswer(String answervalue, String qnum) {
		ModelAndView mav = new ModelAndView();
		int suc = dao.qnaanswer(answervalue,qnum);
		String page="redirect:/qna";
		System.out.println("성공?" + suc);
		mav.setViewName(page);
		return mav;
	}
	
	
	

}
