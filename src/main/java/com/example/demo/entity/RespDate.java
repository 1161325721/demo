package com.example.demo.entity;

import java.util.List;

/**
 * @program: demo
 * @ClassName: RespDate
 * @description:
 * @author: JX190728
 * @create: 2020-02-11 14:18
 **/
public class RespDate
{
	private int code;
	private String msg;
	private List<Object> data;

	public RespDate()
	{
	}

	public RespDate(int code, String msg, List<Object> data)
	{
		this.code = code;
		this.msg = msg;
		this.data = data;
	}

	public int getCode()
	{
		return code;
	}

	public void setCode(int code)
	{
		this.code = code;
	}

	public String getMsg()
	{
		return msg;
	}

	public void setMsg(String msg)
	{
		this.msg = msg;
	}

	public List<Object> getData()
	{
		return data;
	}

	public void setData(List<Object> data)
	{
		this.data = data;
	}

	@Override
	public String toString()
	{
		return "RespDate{" + "code=" + code + ", msg='" + msg + '\'' + ", data=" + data + '}';
	}
}
