package com.framework.loippi.service;

import com.framework.loippi.entity.Article;
import com.framework.loippi.support.Page;
import com.framework.loippi.support.Pageable;

/**
 * SERVICE -Article
 * 
 * @author Loippi Team
 * @version 1.0
 */
public interface ArticleService extends GenericService<Article, Long> {

/**
 * 关联AccountArticle表进行分页查询
 * @param pageable
 * @return
 */
	Page<Article> findWithAccountByPage(Pageable pageable);

}
