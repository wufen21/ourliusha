package com.framework.loippi.controller.admin;

import javax.annotation.Resource;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.framework.loippi.service.FeedbackService;
import com.framework.loippi.support.Message;
import com.framework.loippi.support.Pageable;

@Controller("adminFeedbackController")
@RequestMapping("/admin/feedback")
public class FeedbackController extends GenericController {

	@Resource
	private FeedbackService feedbackService;

	

	/**
	 * 列表
	 */
	@RequiresPermissions("admin:feedback:list")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Pageable pageable, ModelMap model) {
		model.addAttribute("page", feedbackService.findByPage(pageable));
		return "/admin/feedback/list";
	}

	/**
	 * 查看
	 */
	@RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
	public String view(@PathVariable Long id, ModelMap model) {
		model.addAttribute("log", feedbackService.find(id));
		return "/admin/feedback/view";
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody
	Message delete(Long[] ids) {
		feedbackService.deleteAll(ids);
		return SUCCESS_MESSAGE;
	}

}
