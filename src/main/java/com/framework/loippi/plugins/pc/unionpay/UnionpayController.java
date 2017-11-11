package com.framework.loippi.plugins.pc.unionpay;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.framework.loippi.controller.admin.GenericController;
import com.framework.loippi.entity.PluginConfig;
import com.framework.loippi.plugins.pc.PaymentPlugin;
import com.framework.loippi.plugins.pc.PaymentPlugin.FeeType;
import com.framework.loippi.service.PluginConfigAttributeService;
import com.framework.loippi.service.PluginConfigService;
import com.framework.loippi.support.Message;

/**
 * Controller - 银联在线支付
 * 
 * @author Loippi Team
 * @version 2.0
 */
@Controller("adminUnionpayController")
@RequestMapping("/admin/payment_plugin/unionpay")
public class UnionpayController extends GenericController {

	@Resource(name = "unionpayPlugin")
	private UnionpayPlugin unionpayPlugin;
	@Resource(name = "pluginConfigServiceImpl")
	private PluginConfigService pluginConfigService;
	@Resource
	private PluginConfigAttributeService pluginConfigAttributeService;
	/**
	 * 安装
	 */
	@RequestMapping(value = "/install", method = RequestMethod.POST)
	public @ResponseBody Message install() {
		if (!unionpayPlugin.getIsInstalled()) {
			PluginConfig pluginConfig = new PluginConfig();
			pluginConfig.setPluginId(unionpayPlugin.getId());
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
		if (unionpayPlugin.getIsInstalled()) {
			PluginConfig pluginConfig = unionpayPlugin.getPluginConfig();
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
		PluginConfig pluginConfig = unionpayPlugin.getPluginConfig();
		model.addAttribute("feeTypes", FeeType.values());
		model.addAttribute("pluginConfig", pluginConfig);
		return "/com/framework/loippi/plugins/unionpay/setting";
	}

	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(String paymentName, String partner, String key, FeeType feeType, BigDecimal fee, String logo, String description, @RequestParam(defaultValue = "0") Integer isEnabled, Integer order, RedirectAttributes redirectAttributes) {
		
		Map<String, String> attributes = new HashMap<String, String>();
		attributes.put(PaymentPlugin.PAYMENT_NAME_ATTRIBUTE_NAME, paymentName);
		attributes.put( "partner", partner);
		attributes.put( "key", key);
		attributes.put( PaymentPlugin.FEE_TYPE_ATTRIBUTE_NAME, feeType.toString());
		attributes.put( PaymentPlugin.FEE_ATTRIBUTE_NAME, fee.toString());
		attributes.put( PaymentPlugin.LOGO_ATTRIBUTE_NAME, logo);
		attributes.put( PaymentPlugin.DESCRIPTION_ATTRIBUTE_NAME, description);
		
		PluginConfig pluginConfig = unionpayPlugin.getPluginConfig();
		pluginConfig.setEnabled(isEnabled);
		pluginConfigService.updatePluginConfig(pluginConfig,attributes);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:/admin/payment_plugin/list.jhtml";
	}

}