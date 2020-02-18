package com.example.demo.service;


import com.example.demo.entity.TableDate;
import org.apache.ibatis.session.RowBounds;

import java.util.HashMap;

public interface FileService
{


	public Object fileEdit(HashMap<String, Object> condition);
	public TableDate reqFileList(HashMap<String, Object> cond, RowBounds rowBounds);

}
