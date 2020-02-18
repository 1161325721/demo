package com.example.demo.controller;

import com.example.demo.entity.TableDate;
import com.example.demo.entity.Userinfo;
import com.google.gson.Gson;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;

@Controller
@RequestMapping("/UserController/")
public class UserController extends BaseController
{

	@RequestMapping(path = "login",produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object login(Userinfo userinfo)
	{
		HashMap<String,Object> rs= userService.userLogin(userinfo);
		return rs.get("msg");
	}

	@RequestMapping(path = "reg",produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object reg(Userinfo userinfo, HttpServletResponse response)
	{
		String msg = "注册失败";
		try
		{
			msg = userService.regAction(userinfo);
		}catch (Exception e){
			e.printStackTrace();
		}
		return msg;
	}

	@RequestMapping(path = "reqUserinfo",produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object reqUserinfo(HttpSession session){
		System.out.println("22222");
		Userinfo userinfo = (Userinfo) session.getAttribute("userinfo");
		System.out.println(new Gson().toJson(userinfo));
		System.out.println(111);
		return userinfo;
	}

	@RequestMapping(path = "reqUserFileList",produces = "application/json")
	@ResponseBody
	public Object reqUserFileList(int page,
	                              int limit,
	                              HttpSession session,
	                              @RequestParam(value = "condition",required=false)HashMap<String,Object> cond)
	{
		Userinfo userinfo = (Userinfo) session.getAttribute("userinfo");
		if (null==cond){
			cond = new HashMap<>();
		}
		cond.put("uid",userinfo.getUid());
		RowBounds rowBounds = new RowBounds((page-1)*limit,limit);
		TableDate tDate = fileService.reqFileList(cond,rowBounds);
		return tDate;
	}


	@RequestMapping(path = "uploadFile",produces = "application/json",method = RequestMethod.POST)
	@ResponseBody
	public Object uploadFile(@RequestParam("file") MultipartFile file){
		System.out.println(file.getOriginalFilename());
		try{
			file.transferTo(new File("C:/Users/127/Desktop/file/" + file.getOriginalFilename()));
		}catch(Exception e){

		}
		return "{\"code\":0, \"msg\":\"asd\", \"data\":{}}";
	}

}
