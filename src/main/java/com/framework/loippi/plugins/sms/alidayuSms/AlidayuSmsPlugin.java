package com.framework.loippi.plugins.sms.alidayuSms;

import org.springframework.stereotype.Component;

import com.framework.loippi.entity.PluginConfig;
import com.framework.loippi.plugins.sms.SmsPlugin;
import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;

import lombok.extern.log4j.Log4j;

/**
 * Plugin - 阿里大鱼
 * 
 * @author Loippi Team
 * @version 2.0
 */
@Log4j
@Component("alidayuSmsPlugin")
public class AlidayuSmsPlugin extends SmsPlugin {

	
	
	@Override
	public String getName() {
		return "阿里大鱼";
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
		return "http://www.alidayu.com/";
	}
	@Override
	public String getInstallUrl() {
		return "alidayu_sms/install.jhtml";
	}

	@Override
	public String getUninstallUrl() {
		return "alidayu_sms/uninstall.jhtml";
	}

	@Override
	public String getSettingUrl() {
		return "alidayu_sms/setting.jhtml";
	}
	@Override
	public void send(String target, String templateId,String sign, String... params) {
		PluginConfig pluginConfig = getPluginConfig();
		if (pluginConfig != null) {
			String serverUrl = pluginConfig.getAttribute("serverUrl");
			String appKey = pluginConfig.getAttribute("appKey");
			String appSecret = pluginConfig.getAttribute("appSecret");
			TaobaoClient client = new DefaultTaobaoClient(serverUrl, appKey, appSecret);
			AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
			req.setSmsType("normal");
			req.setSmsFreeSignName(sign);
			req.setSmsParamString(params[0]);
			req.setRecNum(target);
			req.setSmsTemplateCode(templateId);
			AlibabaAliqinFcSmsNumSendResponse result;
			try {
				result = client.execute(req);
				if ("0".equals(result.getErrorCode())) {
					log.info("已通过阿里大鱼向["+target+"]发送短信成功...");
				}else{
					log.error("调用阿里大鱼发送短信失败:["+result.getErrorCode() +"]"+result.getMsg());
				}
			} catch (ApiException e) {
				e.printStackTrace();
			}
		}
	}
}
