package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: demo
 * @ClassName: TestController
 * @description:
 * @author: JX190728
 * @create: 2020-02-10 19:49
 **/

@Controller
//@RequestMapping("/TestController/")
public class TestController
{

	@RequestMapping(path = "index")
	public String login() {
		System.out.println("aaa");
		return "index";
	}

}
