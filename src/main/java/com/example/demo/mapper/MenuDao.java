package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;
@Mapper
public interface MenuDao
{

	public List<Object> findRoleMenuList(int roleid);
	public List<Object> findRoleMenu(int roleid);
	public void addRoleMenu(HashMap<String, Object> condition);
	public void delRoleMenu(HashMap<String, Object> condition);

}
