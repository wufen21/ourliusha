package com.framework.loippi.plugins.sms.ccpSms;

import java.util.HashMap;

import org.springframework.stereotype.Component;

import com.cloopen.rest.sdk.CCPRestSDK;
import com.framework.loippi.entity.PluginConfig;
import com.framework.loippi.plugins.sms.SmsPlugin;

import lombok.extern.log4j.Log4j;

/**
 * Plugin - 容联云通讯
 * 
 * @author Loippi Team
 * @version 2.0
 */
@Log4j
@Component("ccpSmsPlugin")
public class CcpSmsPlugin extends SmsPlugin {

	@Override
	public String getName() {
		return "容联云通讯";
	}

	@Override
	public String getVersion() {
		return "2.0";
	}

	@Override
	public String getAuthor() {
		return "Loippi Team";
	}

	@Override
	public String getSiteUrl() {
		return "http://www.yuntongxun.com/";
	}

	@Override
	public String getInstallUrl() {
		return "ccp_sms/install.jhtml";
	}

	@Override
	public String getUninstallUrl() {
		return "ccp_sms/uninstall.jhtml";
	}

	@Override
	public String getSettingUrl() {
		return "ccp_sms/setting.jhtml";
	}

	@Override
	public void send(String target, String templateId,String sign,String ... params) {
		PluginConfig pluginConfig = getPluginConfig();
		if (pluginConfig != null) {
			String serverIP = pluginConfig.getAttribute("serverIP");
			String serverPort = pluginConfig.getAttribute("serverPort");
			String accountSid = pluginConfig.getAttribute("accountSid");
			String accountToken = pluginConfig.getAttribute("accountToken");
			String appId = pluginConfig.getAttribute("appId");
			CCPRestSDK sdk = new CCPRestSDK();
			sdk.init(serverIP, serverPort);
			sdk.setAccount(accountSid, accountToken);
			sdk.setAppId(appId);
			HashMap<String, Object> result = sdk.sendTemplateSMS(target, templateId, params);
			if ("000000".equals(result.get("statusCode"))) {
				log.info("已通过容联云通讯向["+target+"]发送短信成功...");
			}else{
				log.error("调用容联云通讯发送短信失败:["+result.get("statusCode") +"]"+result.get("statusMsg"));
			}
		}
	}

}
