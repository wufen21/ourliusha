package com.framework.loippi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.loippi.dao.ArticleCategoryDao;
import com.framework.loippi.entity.ArticleCategory;
import com.framework.loippi.service.ArticleCategoryService;

/**
 * SERVICE - ArticleCategory
 * 
 * @author Loippi Team
 * @version 1.0
 */
@Service("articleCategoryServiceImpl")
public class ArticleCategoryServiceImpl extends GenericServiceImpl<ArticleCategory, Long>implements ArticleCategoryService {

	@Autowired
	private ArticleCategoryDao articleCategoryDao;

	@Autowired
	public void setGenericDao() {
		super.setGenericDao(articleCategoryDao);
	}
}