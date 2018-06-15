package com.secret4news.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.secret4news.dao.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping (value = "/user", method = RequestMethod.PUT)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public String insertUser(@RequestBody HashMap<String, String> requestMap) {
		String id = requestMap.get("id");
		
		if(id == null || id.equals("")) {
			System.out.println("no user id");
			
			return null;
		}
		
		System.out.println("user = " + id);
		
		userDAO.insertUser(requestMap);
		
		String result = userDAO.getVersion();
		System.out.println(result);
		
		return result;
	}
	
	@RequestMapping (value = "/push", method = RequestMethod.PUT)	
	@ResponseStatus(HttpStatus.OK)
	public void setPush(@RequestBody HashMap<String, String> requestMap) {
		String id = requestMap.get("id");
		
		if(id == null || id.equals("")) {
			System.out.println("no user id");
			
			return;
		}
		
		System.out.println("setPush : " + id + " | " + requestMap.get("onoff"));
		
		userDAO.setPush(requestMap);
	}
	
	@RequestMapping (value = "/version", method = RequestMethod.GET)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public String getVersion(@RequestParam(value="id", required=true, defaultValue="0.0") String id) {
		System.out.println("getVersion : " + id);
		
		String result = userDAO.getVersion();
		System.out.println(result);
		
		return result;
	}
	
	@RequestMapping (value = "/version", method = RequestMethod.PUT)	
	@ResponseStatus(HttpStatus.OK)
	public void setVersion(@RequestParam(value="ver", required=true) String ver) {
		System.out.println("setVersion : " + ver);
		
		userDAO.setVersion(ver);
	}
	
	
}
