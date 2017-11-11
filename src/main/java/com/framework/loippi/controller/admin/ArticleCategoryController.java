package com.framework.loippi.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.framework.loippi.entity.ArticleCategory;
import com.framework.loippi.service.ArticleCategoryService;
import com.framework.loippi.support.Message;
import com.framework.loippi.support.Page;
import com.framework.loippi.support.Pageable;

/**
 * Controller - 文章文类
 * 
 * @author Mounate Yan。
 * @version 1.0
 */
@Controller("adminArticleCategoryController")
@RequestMapping("/admin/article_category")
public class ArticleCategoryController extends GenericController {
	
	
	@Resource
	private ArticleCategoryService articleCategoryService;
	
	/**
	 * 添加
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		return "/admin/article_category/add";
	}

	/**
	 * 保存
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(ArticleCategory articleCategory, RedirectAttributes redirectAttributes) {
		Long articleCategoryId = articleCategoryService.save(articleCategory);
		if(articleCategoryId != null )
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 编辑
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Long id, ModelMap model) {
		ArticleCategory articleCategory = articleCategoryService.find(id);
		model.addAttribute("articleCategory", articleCategory);
		return "/admin/article_category/edit";
	}

	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(ArticleCategory articleCategory, RedirectAttributes redirectAttributes) {
		Long articleCategoryId = articleCategoryService.update(articleCategory);
		if(articleCategoryId != null )
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 列表
	 */
	@RequiresPermissions("admin:artile_category:list")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Pageable pageable, HttpServletRequest request, ModelMap model) {
		processQueryConditions(pageable, request);
		Page<ArticleCategory> page = articleCategoryService.findByPage(pageable);
		model.addAttribute("page",  page);
		model.addAttribute("paramter", pageable.getParameter());
		return "/admin/article_category/list";
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody Message delete(Long[] ids) {
		for (Long id : ids) {
			articleCategoryService.delete(id);
		}
		return SUCCESS_MESSAGE;
	}
}
