package com.secret4news.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ArticleDAO {

	public List<HashMap<String, Object>> getArticleList(HashMap<String, Object> hashmap);
	public HashMap<String, Object> getArticle(@Param("aid") int aid);
	public String getArticleUserId(@Param("aid") int aid);
	public void setArticle(HashMap<String, Object> hashmap);
	public void updateArticle(HashMap<String, Object> hashMap);
	public void updateViewCount(@Param("aid") int aid);
	public void deleteArticle(@Param("aid") int aid);
	
	public List<HashMap<String, Object>> getCommentList(@Param("aid") int aid);
	/*public HashMap<String, Object> getComment(@Param("cid") int cid);*/
	public String getCommentUserId(@Param("cid") int cid);
	public void setComment(HashMap<String, Object> hashmap);
	public void updateComment(HashMap<String, Object> hashMap);
	public void deleteComment(@Param("cid") int cid);
}
