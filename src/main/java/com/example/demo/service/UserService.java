package com.example.demo.service;


import com.example.demo.entity.Manger;
import com.example.demo.entity.TableDate;
import com.example.demo.entity.Userinfo;
import org.apache.ibatis.session.RowBounds;

import java.util.HashMap;

public interface UserService
{
	public String regAction(Userinfo uio);
	public HashMap<String,Object> userLogin(Userinfo userinfo);
	public TableDate reqUserList(HashMap<String, Object> cond, RowBounds rowBounds);
	public String mangerLogin(Manger manger);

}
