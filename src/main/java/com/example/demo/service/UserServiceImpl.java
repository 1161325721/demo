package com.example.demo.service;

import com.example.demo.entity.Manger;
import com.example.demo.entity.TableDate;
import com.example.demo.entity.Userinfo;
import com.example.demo.mapper.UserDao;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;


@Service("userService")
public class UserServiceImpl implements UserService
{

	@Resource
	private UserDao userDao;

	@Override
	public HashMap<String,Object> userLogin(Userinfo userinfo)
	{
		HashMap<String,Object> rs = new HashMap<>();
		Userinfo user = userDao.searchByAcc(userinfo);
		if (null==user){
			rs.put("msg","账号不存在");
			return rs;
		}
		if (!userinfo.getUpassword().equals(user.getUpassword())){
			rs.put("msg","密码错误");
			return rs;
		}
		rs.put("msg","登录成功");
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("userinfo",user);
		return rs;
	}




	@Override
	public TableDate reqUserList(HashMap<String, Object> cond, RowBounds rowBounds)
	{
		if (null==cond){
			cond = new HashMap<>();
		}
		List list = userDao.searchUserListByCondition(cond,rowBounds);
		int count = userDao.searchUserCountByCondition(cond);
		TableDate tDate = new TableDate();
		tDate.setData(list);
		tDate.setCount(count);
		return tDate;
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
		return msg;
	}

	@Override
	public String regAction(Userinfo uio)
	{
		uio.setUstate("正常");
		int i = userDao.addUser(uio);
		String sendStr = "注册失败,用户名重复";
		if ( i>0 ){
			sendStr = "注册成功";
		}
		return sendStr;
	}

}
