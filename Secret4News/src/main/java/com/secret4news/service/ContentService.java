package com.secret4news.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.secret4news.common.Constants;
import com.secret4news.dao.CategoryDAO;
import com.secret4news.dao.ContentDAO;

@Service
public class ContentService {

	@Autowired
	private ContentDAO contentDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Transactional
	public List<HashMap<String, Object>> getContents(HashMap<String, Object> requestMap) {
		// category count
		categoryDAO.updateCategoryCount(requestMap);
		
		if(requestMap.get("category").equals(Constants.CATEGORY_RECOMMEND)) {
			return contentDAO.getRecommendContents(requestMap);
		} else if(requestMap.get("category").equals(Constants.CATEGORY_BEST)) {
			return contentDAO.getBestContents(requestMap);
		}
		
		return contentDAO.getContents(requestMap);
	}
	
	@Transactional
	public void setGrade(int id, int grade) {
		if(grade == Constants.GRADE_NORMAL) {
			HashMap<String, Object> contentMap = contentDAO.getRecommendContent(id);
			
			contentDAO.delGrade(id);
			
			if(contentMap.get("category").equals(Constants.CATEGORY_BEST)) {
				contentDAO.updateBestGrade(id, grade);
			} else {
				contentDAO.updateGrade(id, grade);
			}
		} else { // Recommend
			HashMap<String, Object> contentMap = contentDAO.getBestContent(id);
						
			if(contentMap == null) {
				contentMap = contentDAO.getContent(id);
								
				contentDAO.updateGrade(id, grade);				
				contentDAO.setGrade(id);
			} else {
				contentDAO.updateBestGrade(id, grade);				
				contentDAO.setBestGrade(id);
			}
		}
	}
}
