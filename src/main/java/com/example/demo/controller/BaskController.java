package com.example.demo.controller;

import com.example.demo.entity.Manger;
import com.example.demo.entity.TableDate;
import com.google.gson.Gson;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

@Controller
@RequestMapping("/BackController/")
public class BaskController extends BaseController
{
	@RequestMapping(path = "backLogin",produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object backLogin(Manger mio)
	{
		System.out.println(new Gson().toJson(mio));
		String msg = backService.mangerLogin(mio);
		return msg;
	}

	@RequestMapping(path = "reqFileList",produces = "application/json")
	@ResponseBody
	public Object reqFileList(int page,
	                          int limit,
	                          @RequestParam(value = "condition",required=false) HashMap<String,Object> cond)
	{
		RowBounds rowBounds = new RowBounds((page-1)*limit,limit);
		TableDate tDate = fileService.reqFileList(cond,rowBounds);
		return tDate;
	}

	@RequestMapping(path = "fileEdit",produces = "application/json",method = RequestMethod.POST)
	@ResponseBody
	public Object fileEdit( @RequestParam(value = "condition",required=false)HashMap<String,Object>condition)
	{
		String str  = (String)fileService.fileEdit(condition);
		return str;
	}

	@RequestMapping(path = "reqRoleMenuList",produces = "application/json")
	@ResponseBody
	public Object reqRoleMenuList(@RequestParam(value = "condition",required=false) HashMap<String,Object> cond)
	{
		return backService.roleMenuList(Integer.valueOf((String)cond.get("roleid")));
	}

	@RequestMapping(path = "menuEdit",produces = "application/json")
	@ResponseBody
	public Object menuEdit(@RequestParam(value = "condition",required=false) HashMap<String,Object> cond)
	{

		backService.menuEdit(cond);

		return null;
	}


}
