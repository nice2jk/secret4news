package com.secret4news.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.secret4news.common.Constants;
import com.secret4news.service.ArticleService;

@Controller
public class ArticleController {

	@Autowired
	private ArticleService articleService;
	
	@RequestMapping (value = "/articles", method = RequestMethod.GET)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<HashMap<String, Object>> getArticleList(
			@RequestParam(value="offset", required=true, defaultValue="0") int offset,
			@RequestParam(value="search", required=false) String search) {
		System.out.println("getArticleList get : " + offset + " | " + search);
		
		HashMap<String, Object> requestMap = new HashMap<String, Object>();
		
		requestMap.put("offset", offset);
		
		if(search != null) {
			requestMap.put("search", search);
		}
		
		return articleService.getArticleList(requestMap);
	}
	
	@RequestMapping (value = "/article", method = RequestMethod.GET)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public HashMap<String, Object> getArticle(@RequestParam(value="aid", required=true) int aid) {
		System.out.println("getContents GET : " + aid);
		
		return articleService.getArticle(aid);
	}
	
	@RequestMapping (value = "/article", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void setArticle(@RequestBody HashMap<String, Object> requestMap) {
		System.out.println("getContents POST : " + requestMap.get(Constants.USER_ID));
		
		articleService.setArticle(requestMap);
	}
	
	@RequestMapping (value = "/article", method = RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void updateArticle(@RequestBody HashMap<String, Object> requestMap) {
		System.out.println("getContents PUT : " + requestMap.get(Constants.USER_ID) + " | " + requestMap.get(Constants.ARTICLE_ID));
		
		articleService.updateArticle(requestMap);
	}
	
	@RequestMapping (value = "/article", method = RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void deleteArticle(@RequestBody HashMap<String, Object> requestMap) {
		System.out.println("getContents PUT : " + requestMap.get(Constants.USER_ID) + " | " + requestMap.get(Constants.ARTICLE_ID));
		
		articleService.deleteArticle(requestMap);
	}
	
}
