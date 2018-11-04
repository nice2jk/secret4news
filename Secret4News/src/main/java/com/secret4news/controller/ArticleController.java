package com.secret4news.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.secret4news.common.Constants;
import com.secret4news.service.ArticleService;

@Controller
public class ArticleController {

	@Autowired
	private ArticleService articleService;
	
	@RequestMapping (value = "/articles", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public String getArticleList(
			@RequestParam(value="offset", required=true, defaultValue="0") int offset,
			@RequestParam(value="search", required=false) String search,
			Model model) {
		System.out.println("getArticleList get : " + offset + " | " + search);
		
		HashMap<String, Object> requestMap = new HashMap<String, Object>();
		
		requestMap.put("offset", offset);
		
		if(search != null) {
			requestMap.put("search", search);
		}
		
		List<HashMap<String, Object>> responseMap = articleService.getArticleList(requestMap); 
		model.addAttribute("articles", responseMap);
		model.addAttribute("offset", offset);
		
		return "board";
	}
	
	@RequestMapping (value = "/article", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public String getArticle(@RequestParam(value="aid", required=true) int aid, Model model) {
		System.out.println("getContents GET : " + aid);
		
		HashMap<String, Object> article = articleService.getArticle(aid);
		model.addAttribute("article", article);
		
		return "article";
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
	
	@RequestMapping (value = "/write", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public String writeArticle() {
		System.out.println("write");
		
		return "write";
	}
	
	@RequestMapping (value = "/write.done", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public String writeArticle(String atitle, String abody, String apw) {
		System.out.println("write done");
		
		HashMap<String, Object> requestMap = new HashMap<String, Object>();
		requestMap.put("title", atitle);
		abody = abody.replace("\r\n","<br>");
		requestMap.put("body", abody);
		requestMap.put("pw", apw);
		
		articleService.setArticle(requestMap);
		
		return "redirect:/articles";
	}
	
	
}
