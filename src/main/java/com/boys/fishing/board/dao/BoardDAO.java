package com.boys.fishing.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.boys.fishing.board.dto.SumsumDTO;

public interface BoardDAO {

	ArrayList<HashMap<String, String>> qna();

	int QNAwrite(SumsumDTO dto);

	int someWrite(SumsumDTO dto);

}
