package com.framework.loippi.controller.admin;


import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.framework.loippi.entity.Article;
import com.framework.loippi.entity.ArticleCategory;
import com.framework.loippi.service.ArticleCategoryService;
import com.framework.loippi.service.ArticleService;
import com.framework.loippi.support.Message;
import com.framework.loippi.support.Page;
import com.framework.loippi.support.Pageable;
import com.framework.loippi.utils.DateUtils;
import com.framework.loippi.utils.ParameterUtils;
/**
 * Controlelr - 文章管理
 * 
 * @author Loippi Team
 * @version 1.0
 */
@Controller("adminArticleController")
@RequestMapping("/admin/article")
public class ArticleController extends GenericController {
		
	@Resource
	private ArticleService articleService;
	
	@Resource
    private ArticleCategoryService articleCategoryService;
	/**
	 * 添加
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		model.addAttribute("articleCategorys", articleCategoryService.findAll());
		model.addAttribute("publishDate", new java.util.Date());
		return "/admin/article/add";
	}

	/**
	 * 保存
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(Article article, RedirectAttributes redirectAttributes) {
		article.setCreateDate(new java.util.Date());
		if(article.isShow()){
			article.setShow(true);
			article.setPublishDate(new Date());
		}
		 articleService.save(article);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 编辑
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Long id, ModelMap model) {
		Article article = articleService.find(id);
		ArticleCategory articleCategory= articleCategoryService.find(article.getCategoryId());
		if(articleCategory !=  null)
			article.setCategory(articleCategory);
		else{
			
		}
		model.addAttribute("article", article);
		model.addAttribute("articleCategorys", articleCategoryService.findAll());
		return "/admin/article/edit";
	}

	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Article article, RedirectAttributes redirectAttributes) {
		articleService.update(article);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 列表
	 */
	@RequiresPermissions("admin:article:list")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Pageable pageable, HttpServletRequest request, ModelMap model) {
		Map<String, Object> paramter = ParameterUtils.getParametersMapStartingWith(request, "filter_");
		paramter.put("endTime",DateUtils.addDateOneDay((String) paramter.get("endTime")));
		pageable.setParameter(paramter);
		 Page<Article> page = articleService.findByPage(pageable);
		 List<ArticleCategory> articleCategorys= articleCategoryService.findAll();
		model.addAttribute("page",  page);
		model.addAttribute("articleCategorys", articleCategorys);
		paramter.put("endTime",DateUtils.decDateOneDay((String) paramter.get("endTime")));
		model.addAttribute("paramter", paramter);
		return "/admin/article/list";
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody Message delete(Long[] ids) {
		for (Long id : ids) {
			articleService.delete(id);
		}
		return SUCCESS_MESSAGE;
	}

}
