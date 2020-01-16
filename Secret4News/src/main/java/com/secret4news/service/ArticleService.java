package com.secret4news.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.secret4news.common.Constants;
import com.secret4news.dao.ArticleDAO;

@Service
public class ArticleService {

	@Autowired
	private ArticleDAO articleDAO;
	
	public List<HashMap<String, Object>> getArticleList(HashMap<String, Object> hashmap) {
		return articleDAO.getArticleList(hashmap);
	}
	
	public HashMap<String, Object> getArticle(int aid) {
		articleDAO.updateViewCount(aid);
		HashMap<String, Object> responseMap = articleDAO.getArticle(aid);
		List<HashMap<String, Object>> commentList = articleDAO.getCommentList(aid);
		
		responseMap.put("comments", commentList);
		
		return responseMap;
	}
	
	@Transactional
	public void setArticle(HashMap<String, Object> requestMap) {
		articleDAO.setArticle(requestMap);
	}
	
/*	@Transactional
	public void updateArticle(HashMap<String, Object> requestMap) {
		String userId = articleDAO.getArticleUserId(Integer.valueOf((String) requestMap.get(Constants.ARTICLE_ID)));
		
		if(userId.equals((String) requestMap.get(Constants.USER_ID))) {
			articleDAO.updateArticle(requestMap);
		}		
	}*/
	
	@Transactional
	public int deleteArticle(HashMap<String, Object> requestMap) {
		String pw = articleDAO.getArticlePw(Integer.valueOf((String) requestMap.get(Constants.ARTICLE_ID)));
		
		if(pw.equals((String) requestMap.get(Constants.ARTICLE_PW))) {
			articleDAO.deleteArticle(Integer.valueOf((String) requestMap.get(Constants.ARTICLE_ID)));
			return 1;
		}
		
		return 0;
	}
	
	@Transactional
	public void setComment(HashMap<String, Object> requestMap) {
		articleDAO.setComment(requestMap);
	}
	
	@Transactional
	public void updateComment(HashMap<String, Object> requestMap) {
		String userId = articleDAO.getCommentUserId(Integer.valueOf((String) requestMap.get(Constants.COMMENT_ID)));
		
		if(userId.equals((String) requestMap.get(Constants.USER_ID))) {
			articleDAO.updateComment(requestMap);
		}
	}
	
	@Transactional
	public void deleteComment(HashMap<String, Object> requestMap) {
		String userId = articleDAO.getCommentUserId(Integer.valueOf((String) requestMap.get(Constants.COMMENT_ID)));
		
		if(userId.equals((String) requestMap.get(Constants.USER_ID))) {
			articleDAO.deleteComment(Integer.valueOf((String) requestMap.get(Constants.COMMENT_ID)));
		}
	}
	
}
