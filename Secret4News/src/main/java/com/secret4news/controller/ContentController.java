package com.secret4news.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.http.HttpStatus;

import com.secret4news.service.ContentService;

@Controller
public class ContentController {
	
	@Autowired
	private ContentService contentService;
	
	@RequestMapping (value = "/contents", method = RequestMethod.GET)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<HashMap<String, Object>> getContents(
			@RequestParam(value="category", required=true) String category,
			@RequestParam(value="offset", required=true, defaultValue="0") int offset,
			@RequestParam(value="search", required=false) String search) {
		System.out.println("getContents GET : " + category + " | " + offset + " | " + search);
		
		HashMap<String, Object> requestMap = new HashMap<String, Object>();
				
		requestMap.put("category", category);
		requestMap.put("offset", offset);
		
		if(search != null) {
			requestMap.put("search", search);
		}
		
		return contentService.getContents(requestMap);
	}
	
	@RequestMapping (value = "/contents", method = RequestMethod.POST)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<HashMap<String, Object>> getContents(@RequestBody HashMap<String, Object> requestMap) {
		System.out.println("getContents POST : " + requestMap);		
		
		List<HashMap<String, Object>> responseMap = contentService.getContents(requestMap);
				
		return responseMap;
	}
	
	@RequestMapping (value = "/contents/grade", method = RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void setGrade(
			@RequestParam(value="id", required=true) int id, 
			@RequestParam(value="grade", required=true, defaultValue="1") int grade) {
		System.out.println("setGrade : " + id + " | " + grade);
		
		contentService.setGrade(id, grade);
	}
}
