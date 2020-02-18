package com.example.demo.service;

import com.example.demo.entity.Manger;

import java.util.HashMap;
import java.util.List;

public interface BackService
{

	public List roleMenuList(int roleid);
	public String mangerLogin(Manger manger);
	public String menuEdit(HashMap<String, Object> condition);
}
