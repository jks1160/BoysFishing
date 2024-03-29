package com.boys.fishing.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.servlet.ModelAndView;

import com.boys.fishing.board.dto.SumsumDTO;

public interface BoardDAO {

	ArrayList<HashMap<String, String>> qna();

	int QNAwrite(SumsumDTO dto);

	int someWrite(SumsumDTO dto);

	ArrayList<SumsumDTO> someTalkList(String sel);

	ArrayList<String> fish();

	int someImgUpload(String string, String file);

	SumsumDTO someDetail(String b_num);

	ArrayList<SumsumDTO> fileList(String b_num);

	int fileDel(int b_num);

	int someUpdate(SumsumDTO dto);

	int someDelete(String b_num);

	int qnaanswer(String answervalue, String qnum);


}
