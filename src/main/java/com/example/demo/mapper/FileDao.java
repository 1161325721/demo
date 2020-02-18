package com.example.demo.mapper;

import com.example.demo.entity.Fileinfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;
import java.util.HashMap;

@Mapper
public interface FileDao
{
	public Fileinfo findFileById(int fid);
	public ArrayList<Fileinfo> findFileByUid(int uid);
	public ArrayList<Fileinfo> findFileByCondition(HashMap<String, Object> condition, RowBounds rowBounds);
	public int findFileCountByCondition(HashMap<String, Object> condition);
	public int editFileinfo(HashMap<String, Object> condition);
	public int addFile(HashMap<String, Object> condition);
	public int addFile2(@Param("map") Fileinfo fileinfo);
}
