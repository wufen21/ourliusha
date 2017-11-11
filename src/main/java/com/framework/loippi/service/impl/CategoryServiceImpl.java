package com.framework.loippi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.loippi.dao.CategoryDao;
import com.framework.loippi.entity.Category;
import com.framework.loippi.service.CategoryService;

/**
 * SERVICE - Category(接口分类)
 * 
 * @author Loippi Team
 * @version 2.0
 */
@Service
public class CategoryServiceImpl extends GenericServiceImpl<Category, Long> implements CategoryService {
	
	@Autowired
	private CategoryDao categoryDao;
	
	
	@Autowired
	public void setGenericDao() {
		super.setGenericDao(categoryDao);
	}
}
