package com.framework.loippi.controller.admin;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.framework.loippi.entity.Ad;
import com.framework.loippi.service.AdService;
import com.framework.loippi.service.UserService;
import com.framework.loippi.support.Message;
import com.framework.loippi.support.Pageable;

/**
 * Controller - 广告
 * 
 * @author Mounate Yan。
 * @version 1.0
 */
@Controller("adminAdController")
@RequestMapping({ "/admin/ad" })
public class AdController extends GenericController {

	@Resource
	private AdService adService;

	@Resource
	private UserService userService;

	/**
	 * 跳转添加页面
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = { "/add" }, method = { RequestMethod.GET })
	public String add(ModelMap model) {
		return "/admin/ad/add";
	}

	/**
	 * 保存
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(Ad ad, RedirectAttributes redirectAttributes) {
		if (ad.getStartDate() != null && ad.getEndDate() != null && ad.getStartDate().after(ad.getEndDate())) {
			return ERROR_VIEW;
		}

		ad.setCreator(userService.getCurrent().getId());
		ad.setCreateDate(new Date());
		adService.save(ad);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 编辑
	 */
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable Long id, ModelMap model) {
		Ad ad = adService.find(id);
		model.addAttribute("ad", ad);
		return "/admin/ad/edit";
	}

	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Ad ad, RedirectAttributes redirectAttributes) {
		if (ad.getStartDate() != null && ad.getEndDate() != null && ad.getStartDate().after(ad.getEndDate())) {
			return ERROR_VIEW;
		}
		ad.setCreator(userService.getCurrent().getId());
		ad.setCreateDate(new Date());
		adService.update(ad);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}

	/**
	 * 列表查询
	 * 
	 * @param pageable
	 * @param model
	 * @return
	 */
	@RequestMapping(value = { "/list" }, method = { RequestMethod.GET })
	public String list(Pageable pageable, ModelMap model) {
		model.addAttribute("page", this.adService.findByPage(pageable));
		return "/admin/ad/list";
	}

	/**
	 * 删除操作
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = { "/delete" }, method = { RequestMethod.POST })
	@ResponseBody
	public Message delete(Long[] ids) {
		this.adService.deleteAll(ids);
		return SUCCESS_MESSAGE;
	}
}
