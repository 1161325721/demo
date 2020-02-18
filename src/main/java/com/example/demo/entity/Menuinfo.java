package com.example.demo.entity;

public class Menuinfo
{
	private int menuid;
	private String menuname;
	private String menuurl;
	private int parentmenuid;

	public Menuinfo()
	{
	}

	public Menuinfo(int menuid, String menuname, String menuurl, int parentmenuid)
	{
		this.menuid = menuid;
		this.menuname = menuname;
		this.menuurl = menuurl;
		this.parentmenuid = parentmenuid;
	}

	public int getMenuid()
	{
		return menuid;
	}

	public void setMenuid(int menuid)
	{
		this.menuid = menuid;
	}

	public String getMenuname()
	{
		return menuname;
	}

	public void setMenuname(String menuname)
	{
		this.menuname = menuname;
	}

	public String getMenuurl()
	{
		return menuurl;
	}

	public void setMenuurl(String menuurl)
	{
		this.menuurl = menuurl;
	}

	public int getParentmenuid()
	{
		return parentmenuid;
	}

	public void setParentmenuid(int parentmenuid)
	{
		this.parentmenuid = parentmenuid;
	}

	@Override
	public String toString()
	{
		return "Menuinfo{" + "menuid=" + menuid + ", menuname='" + menuname + '\'' + ", menuurl='" + menuurl + '\'' + ", parentmenuid=" + parentmenuid + '}';
	}
}
