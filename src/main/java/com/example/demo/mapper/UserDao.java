package com.example.demo.mapper;

import com.example.demo.entity.Manger;
import com.example.demo.entity.Userinfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;
import java.util.HashMap;

@Mapper
public interface UserDao
{
	public Userinfo searchByAcc(Userinfo userinfo);
	public Userinfo searchById(Userinfo userinfo);
	public ArrayList<Userinfo> searchUserListByCondition(HashMap<String, Object> condition, RowBounds rowBounds);
	public Manger searchMangerByAcc(Manger manger);
	public int addUser(Userinfo userinfo);
	public int searchUserCountByCondition(HashMap<String, Object> condition);
}
