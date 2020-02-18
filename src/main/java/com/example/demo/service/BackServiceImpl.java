package com.example.demo.service;

import com.example.demo.entity.Manger;
import com.example.demo.mapper.MenuDao;
import com.example.demo.mapper.UserDao;
import com.google.gson.Gson;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;


@Service("backService")
public class BackServiceImpl implements BackService
{

	@Resource
	private UserDao userDao;
	@Resource
	private MenuDao menuDao;

	@Override
	public List roleMenuList(int roleid)
	{
		return menuDao.findRoleMenu(roleid);
	}

	@Override
	public String mangerLogin(Manger manger)
	{
		Manger m = userDao.searchMangerByAcc(manger);
		String msg = "";
		if (null==m){
			msg = "账号不存在";
			return msg;
		}
		if (!manger.getManpassword().equals(m.getManpassword())){
			msg = "密码错误";
			return msg;
		}
		msg = "登录成功";
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("mangerinfo",m);

		List l = menuDao.findRoleMenuList(1);
		session.setAttribute("menuinfo",l);
		return msg;
	}

	@Override
	public String menuEdit(HashMap<String, Object> condition)
	{
//
//		List addList = (List) condition.get("addList");
//		List delList = (List) condition.get("delList");
//		List delList = (List) condition.get("delList");

		System.out.println(new Gson().toJson(condition));
		if (((List)condition.get("addList")).size()>0){
			menuDao.addRoleMenu(condition);
		}
		if (((List)condition.get("delList")).size()>0){
			menuDao.delRoleMenu(condition);
		}

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		List l = menuDao.findRoleMenuList(1);
		session.setAttribute("menuinfo",l);
		return null;
	}


}
