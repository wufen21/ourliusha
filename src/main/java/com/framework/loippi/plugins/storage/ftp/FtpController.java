package com.framework.loippi.plugins.storage.ftp;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.framework.loippi.controller.admin.GenericController;
import com.framework.loippi.entity.PluginConfig;
import com.framework.loippi.service.PluginConfigAttributeService;
import com.framework.loippi.service.PluginConfigService;
import com.framework.loippi.support.Message;

/**
 * Controller - FTP
 * 
 * @author Mounate Yan。
 * @version 1.0
 */
@Controller("adminPluginFtpController")
@RequestMapping("/admin/storage_plugin/ftp")
public class FtpController extends GenericController {

	@Resource(name = "ftpPlugin")
	private FtpPlugin ftpPlugin;
	@Resource(name = "pluginConfigServiceImpl")
	private PluginConfigService pluginConfigService;
	@Resource
	private PluginConfigAttributeService pluginConfigAttributeService;

	/**
	 * 安装
	 */
	@RequestMapping(value = "/install", method = RequestMethod.POST)
	public @ResponseBody
	Message install() {
		if (!ftpPlugin.getIsInstalled()) {
			PluginConfig pluginConfig = new PluginConfig();
			pluginConfig.setPluginId(ftpPlugin.getId());
			pluginConfig.setEnabled(0);
			pluginConfigService.save(pluginConfig);
		}
		return SUCCESS_MESSAGE;
	}

	/**
	 * 卸载
	 */
	@RequestMapping(value = "/uninstall", method = RequestMethod.POST)
	public @ResponseBody
	Message uninstall() {
		if (ftpPlugin.getIsInstalled()) {
			PluginConfig pluginConfig = ftpPlugin.getPluginConfig();
			pluginConfigService.delete(pluginConfig.getId());
			pluginConfigAttributeService.deleteByPluginId(pluginConfig.getPluginId());
		}
		return SUCCESS_MESSAGE;
	}

	/**
	 * 设置
	 */
	@RequestMapping(value = "/setting", method = RequestMethod.GET)
	public String setting(ModelMap model) {
		PluginConfig pluginConfig = ftpPlugin.getPluginConfig();
		model.addAttribute("pluginConfig", pluginConfig);
		return "/com/framework/loippi/plugins/storage/ftp/setting";
	}

	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(String host, Integer port, String username, String password, String urlPrefix, @RequestParam(defaultValue = "0") Integer isEnabled, Integer order, RedirectAttributes redirectAttributes) {
		Map<String, String> attributes = new HashMap<String, String>();
		attributes.put(FtpPlugin.FTP_HOST, host);
		attributes.put(FtpPlugin.FTP_PORT, port.toString());
		attributes.put(FtpPlugin.FTP_USERNAME, username);
		attributes.put(FtpPlugin.FTP_PASSWORD,password);
		attributes.put(FtpPlugin.FTP_URL_PREFIX, StringUtils.removeEnd(urlPrefix, "/"));
		PluginConfig pluginConfig = ftpPlugin.getPluginConfig();
		pluginConfig.setEnabled(isEnabled);
		pluginConfigService.updatePluginConfig(pluginConfig, attributes);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:/admin/storage_plugin/list";
	}

}