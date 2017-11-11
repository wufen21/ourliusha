package com.framework.loippi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.framework.loippi.dao.ArticleDao;
import com.framework.loippi.entity.Article;
import com.framework.loippi.mybatis.paginator.domain.PageList;
import com.framework.loippi.service.ArticleService;
import com.framework.loippi.support.Page;
import com.framework.loippi.support.Pageable;

/**
 * SERVICE -Article
 * 
 * @author Loippi Team
 * @version 1.0
 */
@Service("articleServiceImpl")
public class ArticleServiceImpl extends GenericServiceImpl<Article, Long>implements ArticleService {

	@Autowired
	private ArticleDao articleDao;

	@Autowired
	public void setGenericDao() {
		super.setGenericDao(articleDao);
	}


	@Transactional(readOnly = true)
	public Page<Article> findWithAccountByPage(Pageable pageable) {
		PageList<Article> result =  articleDao.findWithAccountByPage(pageable.getParameter(), pageable.getPageBounds());
		return new Page<Article>(result, result.getPaginator().getTotalCount(), pageable);
	}
	
	@Override
	@Transactional
	public Long save(Article param) {
		articleDao.insert(param);
		return param.getId();
	}
}