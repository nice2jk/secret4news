package com.secret4news.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

public interface UserDAO {

	public void insertUser(HashMap<String, String> hashmap);
	public void setPush(HashMap<String, String> hashmap);
	public String getVersion();
	public void setVersion(@Param("ver") String ver);
	
}
