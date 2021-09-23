package com.boys.fishing.manage.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/manage")
public class ManageService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ManageService service;
}
