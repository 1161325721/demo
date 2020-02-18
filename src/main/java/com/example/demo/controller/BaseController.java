package com.example.demo.controller;

import com.example.demo.service.BackService;
import com.example.demo.service.FileService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/BaseController/")
public class BaseController
{

	@Autowired
	protected UserService userService;
	@Autowired
	protected BackService backService;
	@Autowired
	protected FileService fileService;

	@RequestMapping(path = "toPage/{pageName}")
	public String toPage(@PathVariable("pageName") String pageName){
		return pageName;
	}
}
