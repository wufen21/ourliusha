package com.framework.loippi.controller.admin;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.framework.loippi.service.PluginService;

/**
 * Controller - 短信插件
 * 
 * @author Loippi Team
 * @version 2.0
 */
@Controller("adminSmsPluginController")
@RequestMapping("/admin/sms_plugin")
public class SmsPluginController extends GenericController {

	@Resource(name = "pluginServiceImpl")
	private PluginService pluginService;

	/**
	 * 列表
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(ModelMap model) {
		model.addAttribute("smsPlugins", pluginService.getSmsPlugins());
		return "/admin/sms_plugin/list";
	}

}