package com.framework.loippi.plugins.sms.ucpaasSms;

import java.io.ByteArrayInputStream;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.BasicHttpEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Component;

import com.framework.loippi.entity.PluginConfig;
import com.framework.loippi.plugins.sms.SmsPlugin;
import com.framework.loippi.utils.des.XDigestUtils;

import lombok.extern.log4j.Log4j;
import net.sf.json.JSONObject;

/**
 * Plugin - 云之讯
 * 
 * @author Loippi Team
 * @version 2.0
 */
@SuppressWarnings("deprecation")
@Log4j
@Component("ucpaasSmsPlugin")
public class UcpaasSmsPlugin extends SmsPlugin {
	@Override
	public String getName() {
		return "云之讯";
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
		return "http://www.ucpaas.com/";
	}
	@Override
	public String getInstallUrl() {
		return "ucpaas_sms/install.jhtml";
	}

	@Override
	public String getUninstallUrl() {
		return "ucpaas_sms/uninstall.jhtml";
	}

	@Override
	public String getSettingUrl() {
		return "ucpaas_sms/setting.jhtml";
	}
	public String getSignature(String accountSid, String authToken,String timestamp) throws Exception{
		String sig = accountSid + authToken + timestamp;
		String signature = XDigestUtils.md5Hex(sig);
		return signature;
	}
	
	@SuppressWarnings("resource")
	public void post(String cType,String accountSid,String authToken,String timestamp,String url,String body) {
		DefaultHttpClient httpclient = new DefaultHttpClient();
		try {
			HttpPost httppost = new HttpPost(url);
			httppost.setHeader("Accept", cType);
			httppost.setHeader("Content-Type", cType+";charset=utf-8");
			String src = accountSid + ":" + timestamp;
			String auth = XDigestUtils.encryptBASE64(src.getBytes("UTF8"));
			httppost.setHeader("Authorization", auth);
			BasicHttpEntity requestBody = new BasicHttpEntity();
	        requestBody.setContent(new ByteArrayInputStream(body.getBytes("UTF-8")));
	        requestBody.setContentLength(body.getBytes("UTF-8").length);
	        httppost.setEntity(requestBody);
	        // 执行客户端请求
			HttpResponse response = httpclient.execute(httppost);
			HttpEntity entity = response.getEntity();
			if (entity != null) {
				String result = EntityUtils.toString(entity, "UTF-8");
				JSONObject json = JSONObject.fromObject(result);
				if ("000000".equals(json.getString("respCode"))) {
					log.info("已通过云之讯发送短信成功...");
				}else{
					log.error("调用云之讯发送短信失败！");
				}
			}
			EntityUtils.consume(entity);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			 httpclient.getConnectionManager().shutdown();
		}
	}
	@Override
	public void send(String target, String templateId, String sign, String... params) {
		PluginConfig pluginConfig = getPluginConfig();
		if (pluginConfig != null) {
			String server = pluginConfig.getAttribute("server");
			String appId = pluginConfig.getAttribute("appId");
			String version = pluginConfig.getAttribute("version");
			String accountSid = pluginConfig.getAttribute("accountSid");
			String authToken = pluginConfig.getAttribute("authToken");
			String url = server+ "/"+version + "/Accounts/" + accountSid + "/Messages/templateSMS";
			String body = "{ \"templateSMS\" : {\"appId\"       : \""+appId+"\",\"param\"       : \""+params[0]+"\",\"templateId\"  : \""+templateId+"\", \"to\"          : \""+target+"\"}}";
			post("application/json", accountSid, authToken, System.currentTimeMillis()+"", url, body);
		}
	}

}
