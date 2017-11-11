package com.framework.loippi.plugins.storage.file;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.framework.loippi.controller.admin.GenericController;
import com.framework.loippi.entity.PluginConfig;
import com.framework.loippi.service.PluginConfigService;

/**
 * Controller - 本地文件存储
 * 
 * @author Loippi Team
 * @version 2.0
 */
@Controller("adminPluginFileController")
@RequestMapping("/admin/storage_plugin/file")
public class FileController extends GenericController {

	@Resource(name = "filePlugin")
	private FilePlugin filePlugin;
	@Resource(name = "pluginConfigServiceImpl")
	private PluginConfigService pluginConfigService;

	/**
	 * 设置
	 */
	@RequestMapping(value = "/setting", method = RequestMethod.GET)
	public String setting(ModelMap model) {
		PluginConfig pluginConfig = filePlugin.getPluginConfig();
		model.addAttribute("pluginConfig", pluginConfig);
		return "/com/framework/loippi/plugins/file/setting";
	}

	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Integer order, RedirectAttributes redirectAttributes) {
		PluginConfig pluginConfig = filePlugin.getPluginConfig();
		pluginConfig.setEnabled(1);
		pluginConfigService.update(pluginConfig);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:/admin/storage_plugin/list";
	}

}