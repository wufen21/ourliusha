package com.framework.loippi.plugins.storage.qiniu;

import java.math.BigDecimal;
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
 * Controller - 七牛云存储
 * 
 * @author Loippi Team
 * @version 2.0
 */
@Controller("adminPluginQiniuController")
@RequestMapping("/admin/storage_plugin/qiniu")
public class QiniuController extends GenericController {

	@Resource(name = "qiniuPlugin")
	private QiniuPlugin qiniuPlugin;
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
		String specificationVersion = System.getProperty("java.specification.version");
		if (StringUtils.isNotEmpty(specificationVersion)) {
			BigDecimal version = new BigDecimal(specificationVersion);
			if (version.compareTo(new BigDecimal("1.6")) < 0) {
				return Message.error("admin.plugin.oss.unsupportedJavaVersion");
			}
		}
		if (!qiniuPlugin.getIsInstalled()) {
			PluginConfig pluginConfig = new PluginConfig();
			pluginConfig.setPluginId(qiniuPlugin.getId());
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
		if (qiniuPlugin.getIsInstalled()) {
			PluginConfig pluginConfig = qiniuPlugin.getPluginConfig();
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
		PluginConfig pluginConfig = qiniuPlugin.getPluginConfig();
		model.addAttribute("pluginConfig", pluginConfig);
		return "/com/framework/loippi/plugins/storage/qiniu/setting";
	}

	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(String secretKey, String accessKey, String bucketName, String urlPrefix, @RequestParam(defaultValue = "0") Integer isEnabled, Integer order, RedirectAttributes redirectAttributes) {
		Map<String, String> attributes = new HashMap<String, String>();
		attributes.put( "secretKey", secretKey);
		attributes.put( "accessKey", accessKey);
		attributes.put( "bucketName", bucketName);
		attributes.put( "urlPrefix", StringUtils.removeEnd(urlPrefix, "/"));
		PluginConfig pluginConfig = qiniuPlugin.getPluginConfig();
		pluginConfig.setEnabled(isEnabled);
		pluginConfigService.updatePluginConfig(pluginConfig, attributes);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:/admin/storage_plugin/list";
	}

}