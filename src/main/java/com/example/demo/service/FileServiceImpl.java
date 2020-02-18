package com.example.demo.service;

import com.example.demo.entity.TableDate;
import com.example.demo.mapper.FileDao;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;


@Service("fileService")
public class FileServiceImpl implements FileService
{

	@Resource
	private FileDao fileDao;

	@Override
	public Object fileEdit(HashMap<String, Object> condition)
	{
		String str = "false";
		int i = fileDao.editFileinfo(condition);
		if (i>0){
			str="true";
		}
		return str;
	}

	@Override
	public TableDate reqFileList(HashMap<String, Object> cond, RowBounds rowBounds)
	{
		if (null==cond){
			cond = new HashMap<>();
		}
		List list = fileDao.findFileByCondition(cond,rowBounds);
		int count = fileDao.findFileCountByCondition(cond);
		TableDate tDate = new TableDate();
		tDate.setData(list);
		tDate.setCount(count);
		return tDate;
	}


}
