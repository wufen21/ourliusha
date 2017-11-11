package com.framework.loippi.dao;

import com.framework.loippi.entity.Article;
import com.framework.loippi.mybatis.dao.GenericDao;
import com.framework.loippi.mybatis.paginator.domain.PageBounds;
import com.framework.loippi.mybatis.paginator.domain.PageList;

/**
 * DAO - Article
 * 
 * @author Loippi Team
 * @version 1.0
 */
public interface ArticleDao  extends GenericDao<Article, Long> {

	PageList<Article> findWithAccountByPage(Object parameter,
			PageBounds pageBounds);

}
