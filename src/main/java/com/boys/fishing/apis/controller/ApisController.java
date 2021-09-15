package com.boys.fishing.apis.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boys.fishing.apis.service.ApisService;
import com.boys.fishing.user.service.UserService;


@Controller
public class ApisController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ApisService service;
	
}
